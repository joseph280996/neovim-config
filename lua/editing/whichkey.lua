local wk_km = require("utils.keymaps")
return {
  "folke/which-key.nvim", -- Centralized list of all commands UI
  dependencies = {
    { "echasnovski/mini.icons", version = false },
  },
  event = "VeryLazy",
  opts = {
    delay = function(ctx)
      return ctx.plugin and 0 or 500
    end,
    preset = "modern",
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    spec = wk_km,
  },
  config = function(_, opts)
    local whichkey = require("which-key")
    whichkey.setup(opts)
  end,
}
