return {
	-- Themes
	-- 'cocopon/iceberg.vim',
	"shaunsingh/nord.nvim",
	-- { "olivercederborg/poimandres.nvim", config = function() require('poimandres').setup {} end },
	-- 'folke/tokyonight.nvim',
	--"bluz71/vim-nightfly-colors",
	--name = "nightfly",
	config = function()
		-- local colorscheme = 'iceberg'
		local colorscheme = 'nord'
		-- local colorscheme = 'poimandres'
		-- local colorscheme = 'tokyonight-night'
		-- local colorscheme = "nightfly"

		local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
		if not status_ok then
			return
		end
	end,
}
