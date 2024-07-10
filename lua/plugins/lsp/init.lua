return {
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = { "cs" },
  },
  require("plugins.lsp.mason"),
  require("plugins.lsp.mason-lsp"),
  require("plugins.lsp.mason-null-ls"),
  require("plugins.dap.mason-dap"),
  require("plugins.lsp.nvim-lspconfig"),
  require("plugins.lsp.jdtls"),
  require("plugins.lsp.lsp-file-operations"),
  require("plugins.lsp.nlsp-settings"),
  require("plugins.lsp.none-ls"),
  require("plugins.lsp.lsp-signature"),
}
