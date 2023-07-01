local opts = { silent = true, noremap = true }

-- Let 'tl' toggle between this and the last accessed tab
vim.api.nvim_set_keymap('n', '<Leader>tl', ':exe "tabn ".g:lasttab<CR>', opts)
vim.cmd [[ au TabLeave * let g:lasttab = tabpagenr() ]]


-- {{ Split And Tabs }}
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Remapping split navigation to Ctrl + <h,j,k,l>
vim.api.nvim_set_keymap('n', '<c-k>', ':wincmd k<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-j>', ':wincmd j<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-h>', ':wincmd h<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-l>', ':wincmd l<CR>', opts)

-- Friendly Adjusting split size
vim.api.nvim_set_keymap('n', '<c-left>', ':vert res -3<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-right>', ':vert res +3<CR>', opts)

-- Buffer keymappings
vim.keymap.set("n", "]b", "<Plug>(CybuNext)")
vim.keymap.set("n", "[b", "<Plug>(CybuPrev)")
vim.keymap.set("n", "[b", "<Plug>(CybuLastusedPrev)")
vim.keymap.set("n", "[b", "<Plug>(CybuLastusedNext)")
