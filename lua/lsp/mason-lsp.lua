local packages = require("utils.constants").servers

return {
  "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = vim.tbl_deep_extend("keep", packages.lsp),
    automatic_installation = true,
  },
}
