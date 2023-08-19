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
