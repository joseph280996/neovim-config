local servers = require("utils.constants").servers.lsp

return {
  "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonInstallAll" },
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = servers,
    automatic_installation = true,
  },
}
