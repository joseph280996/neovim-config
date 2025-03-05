local servers = require("utils.constants.mason_servers")

return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  cmd = { "Mason", "MasonUpdate", "MasonInstallAll", "MasonInstall" },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = servers.dap,
    })
  end,
}
