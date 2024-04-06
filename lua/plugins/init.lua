return {
  -- Diagnosis
  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    opts = {},
  },

  -- Unit Tests
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-python",
      "Issafalcon/neotest-dotnet",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },

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
