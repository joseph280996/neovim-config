local servers = require("utils.constants.mason_servers")
return {
  "rshkarin/mason-nvim-lint",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-lint",
  },
  opts = {
    ensure_installed = servers.linters,
    automatic_installation = false,
  },
  config = function(_, opts)
    require("mason-nvim-lint").setup(opts)
  end
}
