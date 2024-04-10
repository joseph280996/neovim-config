local servers = require("plugins.lsp.mason-ensured-servers").lsp

return {
  "neovim/nvim-lspconfig", -- Native LSP
  dependencies = {
    "williamboman/mason.nvim", -- Simple to use LSP installer
    "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  },
  config = function()
    local lspconfig = require("lspconfig")

    local opts = {}

    for _, server in pairs(servers) do
      opts = {
        on_attach = require("lua.plugins.lsp.utils.handlers").on_attach,
        capabilities = require("lua.plugins.lsp.utils.handlers").capabilities,
      }

      server = vim.split(server, "@")[1]

      local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("keep", opts, conf_opts)
      end

      lspconfig[server].setup(opts)
    end
  end,
}
