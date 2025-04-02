local lsp_servers = require("utils.constants.mason_servers").lsp
local lsp_keymaps = require("lsp.config.keymap")
local keymaps_setter = require("utils.keymaps_setter")

return {
  "neovim/nvim-lspconfig", -- Native LSP
  event = { "BufReadPost", "BufWritePost", "InsertLeave", "InsertEnter" },
  dependencies = {
    "williamboman/mason.nvim", -- Simple to use LSP installer
    "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
    "saghen/blink.cmp",
  },
  config = function()
    local lspconfig = require("lspconfig")

    local opts = {}

    vim.lsp.inlay_hint.enable(true)
    local servers = {}
    vim.list_extend(servers, lsp_servers)

    for _, server in pairs(servers) do
      opts = {
        on_attach = function(client, bufnr)
          if client.name == "ruff_lsp" then
            client.server_capabilities.hoverProvider = false
          end

          if client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
          end

          keymaps_setter(bufnr, lsp_keymaps)
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
