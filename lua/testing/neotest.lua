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
    {
      "<leader>TD",
      _DEBUG_NEAREST_TEST,
      desc = "Debug Tests",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TRR",
      "<cmd>lua require('neotest').run.run()<cr>",
      desc = "Test Under Cursor",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TRF",
      "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
      desc = "Current File",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TRA",
      "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
      desc = "All Tests",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TWR",
      "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
      desc = "Start File",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TWS",
      "<cmd>lua require('neotest').watch.stop()<cr>",
      desc = "Stop",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TE",
      "<cmd>lua require('neotest').summary.toggle()<cr>",
      desc = "Toggle",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TS",
      "<cmd>lua require('neotest').run.stop()<cr>",
      desc = "Stop Test Run",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>TO",
      "<cmd>lua require('neotest').output_panel.toggle()<cr>",
      desc = "Output",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
