local servers = require("utils.constants.mason_servers")
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
  -- THIS PLUGIN REQUIRE RUNNING SETUP MANUALLY TO WORK
  config = function(_, opts)
    require("mason-conform").setup(opts)
  end
}
