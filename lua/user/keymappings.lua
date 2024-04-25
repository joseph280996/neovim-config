local opts = { silent = true, noremap = true }

-- Let 'tl' toggle between this and the last accessed tab
vim.api.nvim_set_keymap("n", "<Leader>utl", ':exe "tabn ".g:lasttab<CR>', opts)
vim.cmd([[ au TabLeave * let g:lasttab = tabpagenr() ]])

-- {{ Split And Tabs }}
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Remapping split navigation to Ctrl + <h,j,k,l>
local normal_keymaps = {
  ["<c-k>"] = {
    cmd = ":wincmd k<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move To Upper Pane" }),
  },
  ["<c-j>"] = {
    cmd = ":wincmd j<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move to Bottom Pane" }),
  },
  ["<c-h>"] = {
    cmd = ":wincmd h<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move to Left Pane" }),
  },
  ["<c-l>"] = {
    cmd = ":wincmd l<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move to Right Pane" }),
  },
  ["<c-left>"] = {
    cmd = ":vert res -3<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border to the Left" }),
  },
  ["<c-right>"] = {
    cmd = ":vert res +3<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border to the Right" }),
  },
  ["<c-up>"] = {
    cmd = ":hor res -3<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border Upwards" }),
  },
  ["<c-down>"] = {
    cmd = ":hor res +3<CR>",
    opts = vim.tbl_deep_extend("keep", opts, { desc = "Move Pane Border Downwards" }),
  },
}

-- Friendly Adjusting split size
for i, value in ipairs(normal_keymaps) do
  vim.api.nvim_set_keymap("n", value.cmd, value.opts)
end
