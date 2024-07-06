return {
  {
    "folke/which-key.nvim", -- Centralized list of all commands UI
    options = true,
    opts = {
      keymaps_ext = {
        ["lt"] = { name = "Trouble" },
      },
    },
  },
  {
    -- Diagnosis

    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    opts = {},
    keys = {
      {
        "<leader>ltd",
        "<cmd>Trouble diagnostics toggle<cr>",
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
      {
        "<leader>ltw",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        desc = "Troubles in Workspace",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
