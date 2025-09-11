local servers = require("utils.constants.mason_servers").lsp

return {
  "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = servers,
    automatic_installation = true,
  },
  config = function(_, opts)
    require('mason-lspconfig').setup(opts)
  end
}
