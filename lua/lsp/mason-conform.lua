local servers = require("utils.constants.mason_servers")
return {
  "zapling/mason-conform.nvim",
  cmd = { "Mason", "MasonUpdate", "MasonInstallAll", "MasonInstall" },
  dependencies = {
    "williamboman/mason.nvim",
    "stevearc/conform.nvim",
  },
  opts = {
    ensure_installed = servers.formatters,
    ignore_install = { "prettierd" },
  },
}
