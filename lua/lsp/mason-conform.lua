local servers = require("utils.constants").servers
return {
  "zapling/mason-conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "stevearc/conform.nvim",
  },
  opts = {
    ensure_installed = servers.formatters,
    ignore_install = { "prettierd" },
  },
}
