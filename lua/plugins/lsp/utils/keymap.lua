local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(
    bufnr,
    "n",
    "gD",
    "<cmd>lua vim.lsp.buf.declaration()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Go to Declaration" })
  )
  keymap(
    bufnr,
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Go To Definition" })
  )
  keymap(
    bufnr,
    "n",
    "K",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Toggle LSP Hover" })
  )
  keymap(
    bufnr,
    "n",
    "gI",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Go To Implementation" })
  )
  keymap(
    bufnr,
    "n",
    "gr",
    "<cmd>lua vim.lsp.buf.references()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Go To References" })
  )
  keymap(
    bufnr,
    "n",
    "gl",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Open Diagnostic Float" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>li",
    "<cmd>LspInfo<cr>",
    vim.tbl_deep_extend("keep", opts, { desc = "Open LSP Info" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>lI",
    "<cmd>LspInstallInfo<cr>",
    vim.tbl_deep_extend("keep", opts, { desc = "Open LSP Install Info" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>la",
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    vim.tbl_deep_extend("keep", opts, { desc = "Open Code Action" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>lj",
    "<cmd>lua vim.diagnostic.goto_next()<cr>",
    vim.tbl_deep_extend("keep", opts, { desc = "Next Diagnostic" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>lk",
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    vim.tbl_deep_extend("keep", opts, { desc = "Prev Diagnostic" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>lr",
    "<cmd>lua vim.lsp.buf.rename()<cr>",
    vim.tbl_deep_extend("keep", opts, { desc = "Rename Symbol" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>ls",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Display func signature" })
  )
  keymap(
    bufnr,
    "n",
    "<leader>lq",
    "<cmd>lua vim.diagnostic.setloclist()<CR>",
    vim.tbl_deep_extend("keep", opts, { desc = "Quick Fix" })
  )
end

return lsp_keymaps
