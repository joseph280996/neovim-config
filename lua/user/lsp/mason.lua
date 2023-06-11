-- Setup Automatically Install of Servers
local servers = {
	"pyright",
	"tsserver",
	"html",
	"jsonls",
	"ltex",
	"omnisharp",
	"sqlls",
}

local settings = {
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
}

require("lsp-file-operations").setup()
require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local util = require("lspconfig/util")

local path = util.path

local opts = {}
local language_specific_opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	if server == "tsserver" then
		language_specific_opts = {
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		}
		opts = vim.tbl_deep_extend("keep", language_specific_opts, opts)
	end

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
