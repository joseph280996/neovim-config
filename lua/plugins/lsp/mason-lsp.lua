local servers = require("plugins.lsp.mason-ensured-servers")

return {
  "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  opts = {
    ensure_installed = servers,
    automatic_installation = true,
  },
}
