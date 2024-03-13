return {
  -- Themes
  -- 'cocopon/iceberg.vim',
  --"shaunsingh/nord.nvim",
  -- { "olivercederborg/poimandres.nvim", config = function() require('poimandres').setup {} end },
  -- "folke/tokyonight.nvim",
  -- "sainnhe/edge",
  "rebelot/kanagawa.nvim",
  --
  -- [[Vim Nightly Config]]
  --"bluz71/vim-nightfly-colors",
  --name = "nightfly",
  --
  -- [[Catppuccin Config]]
  --[[ "catppuccin/nvim",
  name = "catpuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato",
    background = {
      light = "latte",
      dark = "mocha",
    },
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    transparent_background = false,
    integrations = {
      cmp = true,
      aerial = true,
      alpha = true,
      gitsigns = true,
      mason = true,
      neogit = true,
      neotest = true,
      dap = true,
      cmp = true,
      dap_ui = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      notify = true,
      treesitter_context = true,
      treesitter = true,
      ufo = true,
      window_picker = true,
      telescope = {
        enabled = true,
      },
      lsp_trouble = true,
      which_key = true,
    },
  }, ]]
  config = function(_, opts)
    -- local colorscheme = 'iceberg'
    -- local colorscheme = 'nord'
    -- local colorscheme = 'poimandres'
    -- local colorscheme = "tokyonight-storm"
    -- local colorscheme = "nightfly"
    local colorscheme = "kanagawa"
    --
    --[[ Catppuccin Config
    local colorscheme = "catppuccin"

    local catpuccin = require("catppuccin")
    catpuccin.setup(opts)
    ]]

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
      return
    end
  end,
}
