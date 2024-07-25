return {
  -- "rebelot/kanagawa.nvim",
  -- opts = {
  --   overrides = function(colors)
  --     local theme = colors.theme
  --     return {
  --       NormalFloat = { bg = "none" },
  --       FloatBorder = { bg = "none" },
  --       FloatTitle = { bg = "none" },
  --     }
  --   end,
  -- },
  -- config = function(_, opts)
  --   require("kanagawa").setup(opts)
  --   vim.cmd("colorscheme kanagawa-wave")
  -- end,
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function(_, opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
