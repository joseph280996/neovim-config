local opts = { silent = true, noremap = true }

-- Let 'tl' toggle between this and the last accessed tab
vim.api.nvim_set_keymap("n", "<Leader>utl", ':exe "tabn ".g:lasttab<CR>', opts)
vim.cmd([[ au TabLeave * let g:lasttab = tabpagenr() ]])

-- {{ Split And Tabs }}
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Remapping split navigation to Ctrl + <h,j,k,l>
vim.api.nvim_set_keymap(
  "n",
  "<c-k>",
  ":wincmd k<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move To Upper Pane" })
)
vim.api.nvim_set_keymap(
  "n",
  "<c-j>",
  ":wincmd j<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move to Bottom Pane" })
)
vim.api.nvim_set_keymap(
  "n",
  "<c-h>",
  ":wincmd h<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move to Left Pane" })
)
vim.api.nvim_set_keymap(
  "n",
  "<c-l>",
  ":wincmd l<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move to Right Pane" })
)

-- Friendly Adjusting split size
vim.api.nvim_set_keymap(
  "n",
  "<c-left>",
  ":vert res -3<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border to the Left" })
)
vim.api.nvim_set_keymap(
  "n",
  "<c-right>",
  ":vert res +3<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border to the Right" })
)
vim.api.nvim_set_keymap(
  "n",
  "<c-up>",
  ":hor res -3<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border Upwards" })
)
vim.api.nvim_set_keymap(
  "n",
  "<c-down>",
  ":hor res +3<CR>",
  vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border Downwards" })
)
