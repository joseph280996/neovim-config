return {
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
      show_guides = true,
      layout = {
        default_direction = "prefer_right",
      },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "kyazdani42/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    config = function(_, opts)
      require("aerial").setup(opts)
      require("telescope").load_extension("aerial")
    end,
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
