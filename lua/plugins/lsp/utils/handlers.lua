local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

local status_nullls_ok, null_ls = pcall(require, "null-ls")
if not status_nullls_ok then
  return
end

local status_nullls_sources_ok, null_ls_sources = pcall(require, "null-ls.sources")
if not status_nullls_sources_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

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

function M.format_filter(client)
  local filetype = vim.bo.filetype
  local method = null_ls.methods.FORMATTING
  local available_formatters = null_ls_sources.get_available(filetype, method)

  if #available_formatters > 0 then
    return client.name == "null-ls"
  elseif client.supports_method("textDocument/formatting") then
    return true
  else
    return false
  end
end

M.lsp_formatting = function()
  vim.lsp.buf.format({
    filter = M.format_filter,
    timeout_ms = 8000,
  })
end

M.on_attach = function(client, bufnr)
  local filetype = vim.bo.filetype
  if filetype == "cs" then
    client.server_capabilities.semanticTokensProvider = nil
  end

  if client.name == "ruff_lsp" then
    client.server_capabilities.hoverProvider = false
  end

  lsp_keymaps(bufnr)
end

return M
