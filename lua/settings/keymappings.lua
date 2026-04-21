local opts = require("utils.constants").KEYBINDING_OPTS

vim.keymap.set("n", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "

if vim.g.vscode then
  vim.api.nvim_set_keymap(
    "n",
    "tn",
    "<cmd>tabnext<cr>",
    vim.tbl_deep_extend("force", opts, { desc = "Next tab" })
  )
  vim.api.nvim_set_keymap(
    "n",
    "tp",
    "<cmd>tabprevious<cr>",
    vim.tbl_deep_extend("force", opts, { desc = "Previous tab" })
  )
end
