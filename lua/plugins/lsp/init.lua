local servers = require("plugins.lsp.mason-ensured-servers").lsp

return {
  require("plugins.lsp.mason"),
  require("plugins.lsp.mason-lsp"),
  require("plugins.lsp.mason-null-ls"),
  {
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
          on_attach = require("plugins.lsp.handlers").on_attach,
          capabilities = require("plugins.lsp.handlers").capabilities,
        }

        server = vim.split(server, "@")[1]

        local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
        if require_ok then
          opts = vim.tbl_deep_extend("keep", opts, conf_opts)
        end

        lspconfig[server].setup(opts)
      end

    end,
  },
  require("plugins.lsp.java-lsp-setup"),
  require("plugins.lsp.lsp-file-operations"),
  require("plugins.lsp.nlsp-settings"),
  require("plugins.lsp.null-ls"),
  require("plugins.lsp.lsp-signature"),
}
