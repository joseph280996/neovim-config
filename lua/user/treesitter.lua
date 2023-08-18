local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local status_ok_install, install = pcall(require, "nvim-treesitter.install")
if not status_ok_install then
	return
end

install.compilers = { "gcc" }

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})

configs.setup({
	auto_install = true,
	ensure_installed = {
    "c",
		"vimdoc",
		"sql",
		"java",
		"c_sharp",
		"bash",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"css",
		"markdown",
		"html",
	},
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,          -- false will disable the whole extension
		disable = { "latex" },
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
		filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "markdown", "sql", "cs" },
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
