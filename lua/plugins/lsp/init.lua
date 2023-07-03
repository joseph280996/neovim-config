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

return {
	{
		"neovim/nvim-lspconfig", -- Native LSP
		config = function()
			local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
			if not lspconfig_status_ok then
				return
			end


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
					opts = vim.tbl_deep_extend("force", conf_opts, opts)
				end

				lspconfig[server].setup(opts)
			end
		end,
	},

	{
		"williamboman/mason.nvim", -- Simple to use LSP installer
		config = {
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
		config = {
			ensure_installed = servers,
			automatic_installation = true,
		},
	},

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-tree.lua",
		},
		config = function() end,
	},
	{
		"tamago324/nlsp-settings.nvim",
		config = {
			config_home = vim.fn.stdpath("config") .. "/lua/plugins/lsp/settings",
			local_settings_dir = ".nlsp-settings",
			local_settings_root_markers_fallback = { ".git" },
			append_default_schemas = true,
			loader = "json",
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local status_ok, null_ls = pcall(require, "null-ls")
			if not status_ok then
				return
			end

			local formatting = null_ls.builtins.formatting
			local codeaction = null_ls.builtins.code_actions

			null_ls.setup({
				debug = true,
				sources = {
					codeaction.eslint,
					formatting.eslint,
					formatting.black.with({ extra_args = { "--fast" } }),
					formatting.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),
					formatting.stylua.with({ extra_args = { "--indent-style"}}),
					formatting.latexindent,
				},
			})
		end,
	},
}
