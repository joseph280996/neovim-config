local ensured_install = require("plugins.lsp.mason-ensured-servers")
return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  opts = {
    ensure_installed = ensured_install.nonels,
    automatic_installation = true,
    handlers = {},
  },
}
