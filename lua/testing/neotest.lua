local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

function _DEBUG_NEAREST_TEST()
  require("neotest").run.run({
    strategy = "dap",
  })
end

return -- Unit Tests
{
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",

    -- [[ LANGUAGE SUPPORTED ]]
    "Issafalcon/neotest-dotnet",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
  },
  config = function(_, _)
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          runner = "pytest",
        }),
        require("neotest-dotnet")({
          dap = { justMyCode = false, adapter_name = "netcoredbg" },
          discovery_root = "solution",
        }),
        require("neotest-jest")({
          jestCommand = "npm test --",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>TD",
      _DEBUG_NEAREST_TEST,
      desc = "Debug Tests",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TRR",
      "<cmd>lua require('neotest').run.run()<cr>",
      desc = "Test Under Cursor",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TRF",
      "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      desc = "Current File",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TRA",
      "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
      desc = "All Tests",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TWR",
      "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
      desc = "Start File",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TWS",
      "<cmd>lua require('neotest').watch.stop()<cr>",
      desc = "Stop",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TE",
      "<cmd>lua require('neotest').summary.toggle()<cr>",
      desc = "Toggle",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TS",
      "<cmd>lua require('neotest').run.stop()<cr>",
      desc = "Stop Test Run",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>TO",
      "<cmd>lua require('neotest').output_panel.toggle()<cr>",
      desc = "Output",
    }, KEYBINDING_OPTS),
  },
}
