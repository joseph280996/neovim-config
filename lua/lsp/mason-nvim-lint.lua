local servers = require("utils.constants").servers
return {
  "rshkarin/mason-nvim-lint",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
  },
  opts = {
    ensure_installed = servers.linters
  }
}
