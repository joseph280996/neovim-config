return {
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
      show_guides = true,
      layout = {
        default_direction = "prefer_left",
      },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "kyazdani42/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>xo",
        "<cmd>AerialToggle!<cr>",
        desc = "Outline",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
