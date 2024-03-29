-- Statusline
return {
	"christianchiarulli/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		lazy = true,
	},
	opts = {
		options = {
			icon_enabled = true,
			-- theme = "nord",
      -- theme = "catppuccin",
      theme = "kanagawa",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostic" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype", "aerial" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
