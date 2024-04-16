-- Magma
return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      keymaps_ext = {
        m = { name = "Molten" },
      },
    },
  },
  {
    "benlubas/molten-nvim",
    lazy = false,
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = "willothy/wezterm.nvim",
    init = function()
      vim.g.molten_image_provider = "wezterm"
      vim.g.molten_auto_open_output = true
      vim.g.molten_split_direction = "right"
    end,
    keys = {
      { "<leader>mip", "<cmd>MoltenInit<cr>", desc = "Initialize Python", mode = "n" },
      { "<leader>mr", "<cmd>MoltenEvaluateOperator<cr>", desc = "Evaluate Operator", mode = "n" },
      { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", desc = "Evaluate Whole Line", mode = "n" },
      {
        "<leader>mc",
        "<cmd>MoltenReevaluateCell<cr>",
        desc = "Reevaluate Current Cell",
        mode = "n",
      },
      { "<leader>md", "<cmd>MoltenDelete<cr>", desc = "Delete Output", mode = "n" },
      { "<leader>mo", "<cmd>MoltenEnterOutput<cr>", desc = "Show Output", mode = "n" },
      {
        "<leader>mr",
        "<cmd>MoltenEvaluateVisual<cr>",
        desc = "Evaluate Selection",
        mode = "v",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
