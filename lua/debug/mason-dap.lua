local ensured_install = require("utils.constants").dap
return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  cmd = { "Mason", "MasonUpdate", "MasonInstallAll", "MasonInstall" },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = ensured_install,
    })
  end,
}
