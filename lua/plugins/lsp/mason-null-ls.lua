return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  opts = {
    ensure_installed = { "stylelua", "eslint", "prettier", "markdownlint", "black" },
    automatic_installation = true,
    handlers = {},
  },
}
