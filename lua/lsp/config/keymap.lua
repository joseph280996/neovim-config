local common_keymap = {
  {
    mode = "n",
    lhs = "<leader>lr",
    rhs = "<cmd>lua vim.lsp.buf.rename()<cr>",
    opts = { desc = "Rename Symbol" },
  },
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
  {
    mode = "n",
    lhs = "<leader>la",
    rhs = "<cmd>lua vim.lsp.buf.code_action()<cr>",
    opts = { desc = "Open Code Action" },
  },
  {
    mode = "n",
    lhs = "<leader>lff",
    rhs = "<cmd>lua require('lsp.config.formatter')()<cr>",
    opts = { desc = "File Format" },
  },
}

return common_keymap
