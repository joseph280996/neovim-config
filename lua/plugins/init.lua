return {
	-- LSP
	"neovim/nvim-lspconfig", -- Native LSP
	{
		"williamboman/mason.nvim", -- Simple to use LSP installer
		build = ":MasonUpdate",
	},
	"williamboman/mason-lspconfig.nvim", -- Simple to use LSP installer
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"tamago324/nlsp-settings.nvim",
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-tree.lua",
		},
	},

	-- Diagnosis
	{
		"folke/trouble.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},

	-- DAP
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},

	-- Unit Tests
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/neotest-python",
			"Issafalcon/neotest-dotnet",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},

	-- Code Completion
	"hrsh7th/nvim-cmp",      -- Completion Plugin
	"hrsh7th/cmp-buffer",    -- Buffer Completion
	"hrsh7th/cmp-path",      -- Path Completion
	"hrsh7th/cmp-cmdline",   -- CMD Completion
	"saadparwaiz1/cmp_luasnip", -- Snippet Completion
	"hrsh7th/cmp-nvim-lsp",  -- Buffer Completion
	{
		"tzachar/cmp-tabnine", -- Tabnine
		build = "pwsh ./install.ps1",
		dependencies = "hrsh7th/nvim-cmp",
	},

	-- Lua Development
	"nvim-lua/plenary.nvim",

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v1.*",
	},
	"rafamadriz/friendly-snippets", -- Snippets extension to use


	-- Icon
	"kyazdani42/nvim-web-devicons",

	-- Session
	{
		"rmagatti/session-lens",
		dependencies = {
			"rmagatti/auto-session",
			"nvim-telescope/telescope.nvim",
		},
	},

	-- Fuzzy Finder/Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-telescope/telescope-media-files.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"tom-anders/telescope-vim-bookmarks.nvim",

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- LaTex
	"lervag/vimtex",

	-- Terminals
	{ "akinsho/toggleterm.nvim",   version = "*" },
}
