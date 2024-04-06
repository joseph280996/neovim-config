local get_values_on_os = require("user.utils.get-values-on-os")

-- Magma
return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      keymaps_ext = {
        m = { name = "Magma" },
      },
    },
  },
  {
    "dccsillag/magma-nvim",
    lazy = false,
    ft = { "ipynb" },
    build = ":UpdateRemotePlugins",
    config = function()
      vim.g.magma_image_provider = get_values_on_os({ Window = "none", Linux = "ueberzug" })
      vim.g.magma_automatically_open_output = true
    end,
    keys = {
      { "<leader>mip", "<cmd>MagmaInit<cr>", desc = "Initialize Python", mode = "n" },
      { "<leader>mr", "<cmd>MagmaEvaluateOperator<cr>", desc = "Evaluate Operator", mode = "n" },
      { "<leader>ml", "<cmd>MagmaEvaluateLine<cr>", desc = "Evaluate Whole Line", mode = "n" },
      {
        "<leader>mc",
        "<cmd>MagmaReevaluateCell<cr>",
        desc = "Reevaluate Current Cell",
        mode = "n",
      },
      { "<leader>md", "<cmd>MagmaDelete<cr>", desc = "Delete Output", mode = "n" },
      { "<leader>mo", "<cmd>MagmaShowOutput<cr>", desc = "Show Output", mode = "n" },
      {
        "<leader>mr",
        "<cmd>MagmaEvaluateVisual<cr>",
        desc = "Evaluate Selection",
        mode = "v",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
