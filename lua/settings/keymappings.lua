local opts = require("utils.constants").KEYBINDING_OPTS

vim.keymap.set("n", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

-- Let 'tl' toggle between this and the last accessed tab
opts["desc"] = "Toggle last accessed tab"
vim.api.nvim_set_keymap("n", "<leader>utl", ':exe "tabn ".g:lasttab<CR>', opts)

vim.cmd([[unmap gra]])
vim.cmd([[unmap grn]])
