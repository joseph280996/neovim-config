local servers = require("utils.constants").servers
return {
  "rshkarin/mason-nvim-lint",
  cmd = { "Mason", "MasonUpdate", "MasonInstallAll", "MasonInstall" },
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
  },
  opts = {
    ensure_installed = servers.linters,
    automatic_installation = false,
  },
}
