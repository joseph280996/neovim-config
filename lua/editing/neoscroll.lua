local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      mappings = {},
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing = "linear", -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
    })
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<C-u>",
      "<cmd>lua require('neoscroll').ctrl_u({duration = 500, easing='sine'})<cr>",
      desc = "Scroll half a screen up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-u>",
      "<cmd>lua require('neoscroll').ctrl_u({duration = 500, easing='sine'})<cr>",
      mode = "v",
      desc = "Scroll half a screen up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-d>",
      "<cmd>lua require('neoscroll').ctrl_d({duration = 500, easing='sine'})<cr>",
      desc = "Scroll half a screen down",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-d>",
      "<cmd>lua require('neoscroll').ctrl_d({duration = 500, easing='sine'})<cr>",
      mode = "v",
      desc = "Scroll half a screen down",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-b>",
      "<cmd>lua require('neoscroll').ctrl_b({duration = 1000, easing='sine'})<cr>",
      desc = "Scoll a page up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-b>",
      "<cmd>lua require('neoscroll').ctrl_b({duration = 1000, easing='sine'})<cr>",
      mode = "v",
      desc = "Scroll a page up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-f>",
      "<cmd>lua require('neoscroll').ctrl_f({duration = 1000, easing='sine'})<cr>",
      desc = "Scroll a page down",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-f>",
      "<cmd>lua require('neoscroll').ctrl_f({duration = 1000, easing='sine'})<cr>",
      mode = "v",
      desc = "Scroll a page down",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-y>",
      "<cmd>lua require('neoscroll').scroll(-0.1, {move_cursor = false; duration = 100})<cr>",
      desc = "Scroll a line up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-y>",
      "<cmd>lua require('neoscroll').scroll(-0.1, {move_cursor = false; duration = 100})<cr>",
      mode = "v",
      desc = "Scroll a line up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-e>",
      "<cmd>lua require('neoscroll').scroll(0.1, {move_cursor = false; duration = 100})<cr>",
      desc = "Scroll a line down",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-e>",
      "<cmd>lua require('neoscroll').scroll(0.1, {move_cursor = false; duration = 100})<cr>",
      mode = "v",
      desc = "Scroll a line down",
    }, KEYBINDING_OPTS),
  },
}
