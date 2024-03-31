local get_values_on_os = require("user.utils.get-values-on-os")
local system_name = require("user.utils.os-name")

return {
  -- LaTex
  "lervag/vimtex",
  lazy = false,
  config = function()
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

    -- This enables Vim's and neovim's syntax-related features. Without this, some
    -- VimTeX features will not work (see ":help vimtex-requirements" for more
    -- info).

    -- Viewer options: One may configure the viewer either by specifying a built-in
    -- viewer method:
    -- vim.g.vimtex_view_method = 'zathura'

    -- Or with a generic interface:
    local os_name = vim.loop.os_uname().sysname

    if os_name == system_name.Window then
      vim.g.vimtex_view_general_viewer = "SumatraPDF"
    end

    vim.g.vimtex_view_general_options = get_values_on_os(
      { Window = "-reuse-instance -forward-search @tex @line @pdf", Linux = nil },
      true
    )

    -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
    -- strongly recommended, you probably don't need to configure anything. If you
    -- want another compiler backend, you can change it as follows. The list of
    -- supported backends and further explanation is provided in the documentation,
    -- see ":help vimtex-compiler".
    vim.g.vimtex_compiler_method = "latexmk"
  end,
}
