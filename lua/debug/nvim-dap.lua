--- Rebuilds the project before starting the debug session
---@param co thread
local function rebuild_project(co, path)
  local spinner = require("easy-dotnet.ui-modules.spinner").new()
  spinner:start_spinner("Building")
  vim.fn.jobstart(string.format("dotnet build %s", path), {
    on_exit = function(_, return_code)
      if return_code == 0 then
        spinner:stop_spinner("Built successfully")
      else
        spinner:stop_spinner("Build failed with exit code " .. return_code, vim.log.levels.ERROR)
        error("Build failed")
      end
      coroutine.resume(co)
    end,
  })
  coroutine.yield()
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "igorlfs/nvim-dap-view",
  },
  config = function()
    local dap, dv, dotnet = require("dap"), require("dap-view"), require("easy-dotnet")
    dap.listeners.before.attach["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.launch["dap-view-config"] = function()
      dv.open()
    end
    dap.listeners.before.event_terminated["dap-view-config"] = function()
      dv.close()
    end
    dap.listeners.before.event_exited["dap-view-config"] = function()
      dv.close()
    end

    local debug_dll = nil
    local function ensure_dll()
      if debug_dll ~= nil then
        return debug_dll
      end
      local dll = dotnet.get_debug_dll()
      debug_dll = dll
      return dll
    end

    for _, value in ipairs({ "cs", "fsharp" }) do
      dap.configurations[value] = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          env = function()
            local dll = ensure_dll()
            local vars =
              dotnet.get_environment_variables(dll.project_name, dll.relative_project_path)
            return vars or nil
          end,
          program = function()
            local dll = ensure_dll()
            local co = coroutine.running()
            rebuild_project(co, dll.project_path)
            return dll.relative_dll_path
          end,
          cwd = function()
            local dll = ensure_dll()
            return dll.relative_project_path
          end,
        },
      }
    end

    local install_dir = vim.fn.stdpath("data")

    -- DAP ADAPTERS CONFIG
    dap.adapters.coreclr = {
      type = "executable",
      command = install_dir .. "/mason/packages/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    -- DAP LANG CONFIG
    local mappings = {
      chrome = { "typescript", "javascript" },
      ["pwa-chrome"] = { "typescript", "javascript" },
      node = { "typescript", "javascript" },
      ["pwa-node"] = { "typescript", "javascript" },
      python = { "python" },
    }

    require("dap.ext.vscode").load_launchjs(nil, mappings)

    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapLogPoint",
      { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" }
    )
  end,
  keys = {
    {
      "<leader><F5>",
      "<cmd>lua require('dap').continue()<cr>",
      desc = "Debug Start/continue",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader><F10>",
      "<cmd>lua require('dap').step_over()<cr>",
      desc = "Debug Step Over",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader><F11>",
      "<cmd>lua require('dap').step_into()<cr>",
      desc = "Debug Step Into",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader><F12>",
      "<cmd>lua require('dap').step_out()<cr>",
      desc = "Debug Step Out",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>db",
      "<cmd>lua require('dap').toggle_breakpoint()<cr>",
      desc = "Toggle Breakpoint",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>dl",
      "<cmd>lua require('dap').run_last()<cr>",
      desc = "Run Last",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>dR",
      "<cmd>lua require('dap').repl.toggle()<cr>",
      desc = "Toggle Repl",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>dx",
      "<cmd>lua require('dap').terminate()<cr>",
      desc = "Exit",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
