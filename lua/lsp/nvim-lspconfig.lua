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
    vim.lsp.inlay_hint.enable(true)

    local servers = {}
    vim.list_extend(servers, lsp_servers)

    for _, server in pairs(servers) do
      vim.lsp.enable(server)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client.name == "ruff_lsp" then
          client.server_capabilities.hoverProvider = false
        end

        if client:supports_method("textDocument/foldingRange") then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        keymaps_setter(args.buf, lsp_keymaps)
      end,
    })
  end,
}
