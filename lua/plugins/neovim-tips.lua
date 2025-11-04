local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "saxon1964/neovim-tips",
  version = "*", -- Only update on tagged releases
  lazy = false, -- Load on startup (recommended for daily tip feature)
  dependencies = {
    "MunifTanjim/nui.nvim",
    "OXY2DEV/markview.nvim", -- Rich rendering with advanced features
  },
  opts = {
    -- OPTIONAL: Location of user defined tips (default value shown below)
    user_file = vim.fn.stdpath("config") .. "/neovim_tips/user_tips.md",
    -- OPTIONAL: Prefix for user tips to avoid conflicts (default: "[User] ")
    user_tip_prefix = "[Tung] ",
    -- OPTIONAL: Show warnings when user tips conflict with builtin (default: true)
    warn_on_conflicts = true,
    -- OPTIONAL: Daily tip mode (default: 1)
    -- 0 = off, 1 = once per day, 2 = every startup
    daily_tip = 1,
    -- OPTIONAL: Bookmark symbol (default: "🌟 ")
    bookmark_symbol = "🌟 ",
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>nto",
      ":NeovimTips<CR>",
      desc = "Neovim tips",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend(
      "force",
      { "<leader>nte", ":NeovimTipsEdit<CR>", desc = "Edit your Neovim tips" },
      KEYBINDING_OPTS
    ),
    vim.tbl_deep_extend(
      "force",
      { "<leader>nta", ":NeovimTipsAdd<CR>", desc = "Add your Neovim tip" },
      KEYBINDING_OPTS
    ),
    vim.tbl_deep_extend(
      "force",
      { "<leader>ntr", ":NeovimTipsRandom<CR>", desc = "Show random tip" },
      KEYBINDING_OPTS
    ),
    vim.tbl_deep_extend(
      "force",
      { "<leader>ntp", ":NeovimTipsPdf<CR>", desc = "Open Neovim tips PDF" },
      KEYBINDING_OPTS
    ),
  },
}
