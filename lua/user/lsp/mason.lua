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

local function get_python_path(workspace)
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv from pipenv in workspace directory.
	-- local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
	-- if match ~= '' then
	--   local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
	--   return path.join(venv, 'bin', 'python')
	--end

	-- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

	-- Fallback to system Python.
	return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

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

	if server == "pyright" then
		language_specific_opts = {
			before_init = function(_, config)
				config.settings.python.pythonPath = get_python_path(config.root_dir)
			end,
		}
		opts = vim.tbl_deep_extend("keep", language_specific_opts, opts)
	end

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
