local lsp_servers = require("utils.constants.mason_servers").lsp

return {
  "neovim/nvim-lspconfig", -- Native LSP
  dependencies = {
    "williamboman/mason.nvim", -- Simple to use LSP installer
    "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
    "saghen/blink.cmp",
    "folke/which-key.nvim", -- Centralized list of all commands UI
  },
  config = function()
    local blink_cmp = require("blink.cmp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    capabilities = blink_cmp.get_lsp_capabilities(capabilities)

    vim.lsp.config("*", {
      capabilities = capabilities,
    })
    vim.diagnostic.config({ virtual_text = false })

    vim.lsp.inlay_hint.enable(true)

    local universal_keymap = {
      {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        mode = "n",
        desc = "Open LSP Info",
      },
      {
        "<leader>lI",
        "<cmd>LspInstallInfo<cr>",
        mode = "n",
        desc = "Open LSP Install Info",
      },
    }
    for _, server in pairs(lsp_servers) do
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

        require("which-key").add(universal_keymap)
      end,
    })
  end,
}
