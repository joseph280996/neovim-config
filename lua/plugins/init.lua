return {

  -- Snippets
  "rafamadriz/friendly-snippets", -- Snippets extension to use

  -- Icon
  "kyazdani42/nvim-web-devicons",

  -- Session
  {
    "rmagatti/session-lens",
    dependencies = {
      "rmagatti/auto-session",
      "nvim-telescope/telescope.nvim",
    },
  },
}
