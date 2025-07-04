--- Get path to secret file based on OS
---@param secret_guid any The auto-generated secret GUID
---@return string path The secret path
local function get_secret_path(secret_guid)
  local path = ""
  local home_dir = vim.fn.expand("~")
  if require("easy-dotnet.extensions").isWindows() then
    local secret_path = home_dir
        .. "\\AppData\\Roaming\\Microsoft\\UserSecrets\\"
        .. secret_guid
        .. "\\secrets.json"
    path = secret_path
  else
    local secret_path = home_dir .. "/.microsoft/usersecrets/" .. secret_guid .. "/secrets.json"
    path = secret_path
  end
  return path
end

return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
  config = function()
    local dotnet = require("easy-dotnet")
    -- Options are not required
    dotnet.setup({
      --Optional function to return the path for the dotnet sdk (e.g C:/ProgramFiles/dotnet/sdk/8.0.0)
      -- easy-dotnet will resolve the path automatically if this argument is omitted, for a performance improvement you can add a function that returns a hardcoded string
      -- You should define this function to return a hardcoded path for a performance improvement 🚀
      test_runner = {
        ---@type "split" | "float" | "buf"
        viewmode = "split",
        enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
        noBuild = true,
        noRestore = true,
        icons = {
          passed = "",
          skipped = "",
          failed = "",
          success = "",
          reload = "",
          test = "",
          sln = "󰘐",
          project = "󰘐",
          dir = "",
          package = "",
        },
        mappings = {
          run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
          filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
          debug_test = { lhs = "<leader>d", desc = "debug test" },
          go_to_file = { lhs = "g", desc = "got to file" },
          run_all = { lhs = "<leader>R", desc = "run all tests" },
          run = { lhs = "<leader>r", desc = "run test" },
          peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
          expand = { lhs = "o", desc = "expand" },
          expand_node = { lhs = "E", desc = "expand node" },
          expand_all = { lhs = "-", desc = "expand all" },
          collapse_all = { lhs = "W", desc = "collapse all" },
          close = { lhs = "q", desc = "close testrunner" },
          refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
        },
        --- Optional table of extra args e.g "--blame crash"
        additional_args = {},
      },
      ---@param action "test" | "restore" | "build" | "run"
      terminal = function(path, action, args)
        local commands = {
          run = function()
            return string.format("dotnet run --project %s %s", path, args)
          end,
          test = function()
            return string.format("dotnet test %s %s", path, args)
          end,
          restore = function()
            return string.format("dotnet restore %s %s", path, args)
          end,
          build = function()
            return string.format("dotnet build %s %s", path, args)
          end,
        }

        local command = commands[action]() .. "\r"
        vim.cmd("vsplit")
        vim.cmd("term " .. command)
      end,
      secrets = {
        path = get_secret_path,
      },
      csproj_mappings = true,
      fsproj_mappings = true,
      auto_bootstrap_namespace = {
        --block_scoped, file_scoped
        type = "block_scoped",
        enabled = true,
      },
      picker = "snacks",
      notifications = {
        handler = function(start_event)
          local spinner = require("easy-dotnet.ui-modules.spinner").new()
          spinner:start_spinner(start_event.job.name)
          return function(finished_event)
            spinner:stop_spinner(finished_event.result.text, finished_event.result.level)
          end
        end
      }
    })
  end,
}
