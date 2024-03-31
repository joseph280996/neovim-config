local packages = require("plugins.lsp.mason-ensured-servers")

return {
  "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = vim.tbl_deep_extend("keep", packages.lsp, packages.extra_installation),
    automatic_installation = true,
  },
}
