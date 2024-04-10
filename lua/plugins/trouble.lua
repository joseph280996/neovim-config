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
        "<cmd>TroubleToggle document_diagnostics<cr>",
        desc = "Troubles in Buffer",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>ltf",
        "<cmd>TroubleToggle quickfix<cr>",
        desc = "Trouble Quickfix",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>ltl",
        "<cmd>TroubleToggle loclist<cr>",
        desc = "Trouble in LocList",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>lto",
        "<cmd>TroubleToggle<cr>",
        desc = "Toggle Trouble",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>ltr",
        "<cmd>TroubleToggle lsp_references<cr>",
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
