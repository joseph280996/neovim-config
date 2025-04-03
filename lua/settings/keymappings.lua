local opts = require("utils.constants").KEYBINDING_OPTS

vim.keymap.set("n", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

vim.api.nvim_set_keymap(
  "n",
  "<leader>utl",
  ':exe "tabn ".g:lasttab<CR>',
  vim.tbl_deep_extend("force", opts, { desc = "Toggle last accessed tab" })
)
