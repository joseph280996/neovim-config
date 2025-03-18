local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
local constants = require("utils.constants")

return {
  "mrjones2014/smart-splits.nvim",
  opts = {
    ignored_buftypes = constants.ignored_buftypes,
    ignored_filetypes = constants.ignore_filetypes,
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<A-h>",
      "<cmd>lua require('smart-splits').resize_left(3)<cr>",
      desc = "Resize Split Left",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<A-j>",
      "<cmd>lua require('smart-splits').resize_down(3)<cr>",
      desc = "Resize Split Down",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<A-k>",
      "<cmd>lua require('smart-splits').resize_up(3)<cr>",
      desc = "Resize Split Up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<A-l>",
      "<cmd>lua require('smart-splits').resize_right(3)<cr>",
      desc = "Resize Split Right",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-h>",
      "<cmd>lua require('smart-splits').move_cursor_left({same_row = true})<cr>",
      desc = "Move Cursor to Left Split",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-j>",
      "<cmd>lua require('smart-splits').move_cursor_down({same_row = true})<cr>",
      desc = "Move Cursor to Downward Split",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-k>",
      "<cmd>lua require('smart-splits').move_cursor_up({same_row = true})<cr>",
      desc = "Move Cursor to Upward Split",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<C-l>",
      "<cmd>lua require('smart-splits').move_cursor_right({same_row = true})<cr>",
      desc = "Move Cursor to Right Split",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader><leader>h",
      "<cmd>lua require('smart-splits').swap_buf_left({move_cursor = true})<cr>",
      desc = "Swap buffer in split on the left with buffer in current split",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader><leader>j",
      "<cmd>lua require('smart-splits').swap_buf_down({move_cursor = true})<cr>",
      desc = "Swap buffer in downward splits with buffer in current split",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader><leader>k",
      "<cmd>lua require('smart-splits').swap_buf_up({move_cursor = true})<cr>",
      desc = "Swap buffer in upward splits with buffer in current split",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader><leader>l",
      "<cmd>lua require('smart-splits').swap_buf_right({move_cursor = true})<cr>",
      desc = "Swap buffer in splits on the right with buffer in current split",
    }, KEYBINDING_OPTS),
  },
}
