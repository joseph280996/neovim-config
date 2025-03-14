return {
  -- Diagnosis
  "folke/trouble.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    auto_close = true,
  },
  keys = {
    {
      "<leader>ltd",
      "<cmd>Trouble diagnostics toggle filter.buf=0 win={type=split, position=right}<cr>",
      desc = "Troubles in Buffer",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ltf",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble Quickfix",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ltl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble in LocList",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>lto",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle Trouble",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ltr",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Trouble LSP refs",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
