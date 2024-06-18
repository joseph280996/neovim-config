local ensured_install = require("plugins.lsp.mason-ensured-servers")
return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = ensured_install.dap,
    })
  end,
}
