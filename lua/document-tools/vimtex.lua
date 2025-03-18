local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

local get_values_on_os = require("utils.get-values-on-os")
local constants = require("utils.constants")

local function set_vimtex_viewer()
  vim.g.vimtex_view_general_viewer = get_values_on_os({
    [constants.WINDOW] = "SumatraPDF.exe",
    [constants.LINUX] = "~/.config/nvim/scripts/sumatra.fish",
  }, true)

  vim.g.vimtex_view_general_options = get_values_on_os({
    [constants.WINDOW] = "-reuse-instance -forward-search @tex @line @pdf",
    [constants.LINUX] = "-reuse-instance -forward-search @tex @line @pdf",
  }, true)
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

    local set_vimtex_viewer_fn = get_values_on_os({
      [constants.WINDOW] = set_vimtex_viewer,
      [constants.LINUX] = set_vimtex_viewer,
      [constants.DARWIN] = constants.NOOP,
    })

    set_vimtex_viewer_fn()

    vim.g.vimtex_compiler_method = "latexmk"
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>vtc",
      "<cmd>VimtexCompile<cr>",
      desc = "Compile toggle LaTeX document",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>vtt",
      "<cmd>VimtexTocToggle<cr>",
      desc = "Toggle table of content",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>vtx",
      "<cmd>VimtexClean<cr>",
      desc = "Clean LaTeX document",
    }, KEYBINDING_OPTS),
  },
}
