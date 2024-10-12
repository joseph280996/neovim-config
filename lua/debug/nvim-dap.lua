return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")

    local install_dir = vim.fn.stdpath("data")

    -- DAP ADAPTERS CONFIG
    dap.adapters.netcoredbg = {
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
