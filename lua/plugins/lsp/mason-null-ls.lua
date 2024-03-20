return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  opts = {
    ensure_installed = { "stylelua", "eslint", "prettier", "markdownlint", "black", "proselint" },
    automatic_installation = true,
    handlers = {},
  },
}
