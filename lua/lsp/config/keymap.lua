local common_keymap = {
  {
    mode = "n",
    lhs = "<leader>li",
    rhs = "<cmd>LspInfo<cr>",
    opts = { desc = "Open LSP Info" },
  },
  {
    mode = "n",
    lhs = "<leader>lI",
    rhs = "<cmd>LspInstallInfo<cr>",
    opts = { desc = "Open LSP Install Info" },
  },
}

return common_keymap
