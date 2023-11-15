local M = {}

local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

M.toggle_bwcomment_selection = function()
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end

M.toggle_lwcomment_selection = function()
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end
return M
