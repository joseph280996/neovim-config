local get_values_on_os = require("utils.get-values-on-os")
local constants = require("utils.constants")

local WINDOW_SETTING = {
  vimtex_view_general_viewer = "SumatraPDF.exe",
  vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf",
}

local WSL_SETTING = {
  vimtex_view_general_viewer = "fish ~/.config/nvim/scripts/sumatra.fish",
  vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf",
}

local DARWIN_SETTING = {
  vimtex_view_method = "sioyek",
  vimtex_callback_progpath = "nvim",
}

return {
  -- LaTex
  "lervag/vimtex",
  ft = "tex",
  init = function()
    local vimtex_options = get_values_on_os({
      [constants.WINDOW] = WINDOW_SETTING,
      [constants.LINUX] = WSL_SETTING,
      [constants.DARWIN] = DARWIN_SETTING,
    })

    for setting, value in pairs(vimtex_options) do
      vim.g[setting] = value
    end

    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_complete_enabled = false
  end,
}
