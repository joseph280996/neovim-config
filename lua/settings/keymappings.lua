local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

-- Let 'tl' toggle between this and the last accessed tab
vim.api.nvim_set_keymap("n", "<leader>utl", ':exe "tabn ".g:lasttab<CR>', opts)
vim.cmd([[ au TabLeave * let g:lasttab = tabpagenr() ]])

-- {{ Split And Tabs }}
vim.opt.splitbelow = true
vim.opt.splitright = true
