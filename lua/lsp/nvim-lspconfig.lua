local servers = require("utils.constants").servers.lsp
local lsp_keymaps = require("lsp.config.keymap")

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

    for _, server in pairs(servers) do
      opts = {
        on_attach = function(client, bufnr)
          if client.name == "ruff_lsp" then
            client.server_capabilities.hoverProvider = false
          end

          lsp_keymaps(bufnr)
        end,
        capabilities = require("lsp.config.capabilities"),
      }

      local require_ok, conf_opts = pcall(require, "lsp.server_settings." .. server)
      if require_ok then
        opts = vim.tbl_deep_extend("keep", opts, conf_opts)
      end

      lspconfig[server].setup(opts)
    end
  end,
}
