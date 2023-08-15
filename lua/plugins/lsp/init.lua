local servers = {
  "pyright",
  "tsserver",
  "html",
  "jsonls",
  "ltex",
  "omnisharp",
  "sqlls",
  "lua_ls",
}

--[[
-- Others Mason Package Installed
-- 1. stylua 
-- 2. black
--]]

return {
  {
    "neovim/nvim-lspconfig", -- Native LSP
    dependencies = {
      {
        "williamboman/mason.nvim", -- Simple to use LSP installer
        opts = {
          ui = {
            border = "none",
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
          log_level = vim.log.levels.INFO,
          max_concurrent_installers = 4,
        },
      },
      {
        "williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
        opts = {
          ensure_installed = servers,
          automatic_installation = true,
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")

      local opts = {}
      local language_specific_opts = {}

      for _, server in pairs(servers) do
        opts = {
          on_attach = require("plugins.lsp.handlers").on_attach,
          capabilities = require("plugins.lsp.handlers").capabilities,
        }

        server = vim.split(server, "@")[1]

        if server == "tsserver" then
          language_specific_opts = {
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
          }
          opts = vim.tbl_deep_extend("keep", language_specific_opts, opts)
        end

        local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
        if require_ok then
          opts = vim.tbl_deep_extend("keep", opts, conf_opts)
        end

        lspconfig[server].setup(opts)
      end
    end,
  },
  require("plugins.lsp.lsp-file-operations"),
  require("plugins.lsp.nlsp-settings"),
  require("plugins.lsp.null-ls"),
  require("plugins.lsp.lsp-signature"),
}
