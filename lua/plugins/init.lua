return {
	-- Diagnosis
	{
		"folke/trouble.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
    opts = {}
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

	-- Treesitter

	-- LaTex
	"lervag/vimtex",

	-- Terminals
	{ "akinsho/toggleterm.nvim",   version = "*" },
}
