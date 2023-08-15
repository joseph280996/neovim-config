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
  },
}
