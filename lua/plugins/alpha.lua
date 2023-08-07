return {
	"goolord/alpha-nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
  cmd = "Alpha",
	config = function()
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		-- Settings
		local dashboard = require("alpha.themes.dashboard")

		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl_shortcut = "Macro"
			return b
		end

		local icons = require("user.icons")

		dashboard.section.header.val = {
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
		}
		dashboard.section.buttons.val = {
			button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
			button("e", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
			button(
				"p",
				icons.git.Repo .. " Find project",
				":lua require('telescope').extensions.projects.projects()<CR>"
			),
			button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
			button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
			button("s", icons.ui.SignIn .. " Find Session", ":SearchSession<CR>"),
			button("c", icons.ui.Gear .. " Config", ":e ~/AppData/Local/nvim/init.lua <CR>"),
			button("P", icons.ui.Package .. " Packages", "<cmd>Lazy<cr>"),
			button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
		}
		local function footer()
			-- NOTE: requires the fortune-mod package to work
			-- local handle = io.popen("fortune")
			-- local fortune = handle:read("*a")
			-- handle:close()
			-- return fortune
			return "Tung Pham"
		end

		dashboard.section.footer.val = footer()

		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Macro"
		dashboard.section.footer.opts.hl = "Type"

		dashboard.opts.opts.noautocmd = true
		-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
		alpha.setup(dashboard.opts)
	end,
}
