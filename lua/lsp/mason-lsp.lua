local packages = require("utils.constants").servers

return {
  "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = packages.lsp,
    automatic_installation = true,
  },
}
