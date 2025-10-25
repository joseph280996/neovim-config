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

--@class VimtexViewerSettings
--@field vimtex_view_general_viewer string The path or program to execute for viewing of the rendered LaTeX.
--@field vimtex_view_general_options string The viewer options to run the viewer with.

--@param settings VimtexViewerSettings The settings to pass to vimtex viewer.
local function set_vimtex_viewer(settings)
  if settings then
    vim.g.vimtex_view_general_viewer = settings.vimtex_view_general_viewer
    vim.g.vimtex_view_general_options = settings.vimtex_view_general_options
  end
end

return {
  -- LaTex
  "lervag/vimtex",
  ft = "tex",
  init = function()
    -- This is necessary for VimTeX to load properly. The "indent" is optional.
    -- Note that most plugin managers will do this automatically.
    local options = {
      filetype = on,
      plugin = on,
      indent = on,
      syntax = enable,
    }

    for setting, value in pairs(options) do
      vim.opt[setting] = value
    end

    local vimtex_options = get_values_on_os({
      [constants.WINDOW] = WINDOW_SETTING,
      [constants.LINUX] = WSL_SETTING,
      [constants.DARWIN] = nil,
    })

    set_vimtex_viewer(vimtex_options)

    vim.g.vimtex_compiler_method = "latexmk"
  end,
}
