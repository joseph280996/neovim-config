local servers = require("utils.constants").servers.lsp

return {
  "neovim/nvim-lspconfig", -- Native LSP
  dependencies = {
    "williamboman/mason.nvim", -- Simple to use LSP installer
    "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
  },
  config = function()
    local lspconfig = require("lspconfig")

    local opts = {}

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    for _, server in pairs(servers) do
      opts = {
        on_attach = require("utils.lsp.on_attach"),
        capabilities = require('utils.lsp.capabilities')
      }

      server = vim.split(server, "@")[1]

      local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("keep", opts, conf_opts)
      end

      lspconfig[server].setup(opts)
    end
  end,
}
