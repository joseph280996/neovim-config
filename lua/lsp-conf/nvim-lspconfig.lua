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

    vim.lsp.inlay_hint.enable(false)

    local universal_keymap = {
      {
        "<leader>lh",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
        end,
        mode = "n",
        desc = "Toggle type hint",
      },
      {
        "<leader>li",
        "<cmd>checkhealth lsp<cr>",
        mode = "n",
        desc = "Open LSP Info",
      },
      {
        "<leader>ldf",
        function()
          vim.diagnostic.open_float()
        end,
        mode = "n",
        desc = "Open Diagnostic in floating window",
      },
    }

    vim.highlight.priorities.semantic_tokens = 95

    -- Autocommand to register LSP keymaps when an LSP client attaches to a buffer
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

    -- Autocommand to enable tsserver (tsserver is the LSP server for TypeScript/JavaScript)
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
      callback = function()
        vim.lsp.enable({ "ts_ls", "eslint" })
      end,
    })
  end,
}
