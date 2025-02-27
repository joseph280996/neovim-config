local get_values_on_os = require("utils.get-values-on-os")
local system_name = require("utils.constants").os_name

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

    local os_name = vim.loop.os_uname().sysname

    if os_name == system_name.Window or os_name == system_name.Linux then
      vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
      vim.g.vimtex_view_general_options = get_values_on_os(
        { Window = "-reuse-instance -forward-search @tex @line @pdf", Linux = nil },
        true
      )
    end

    vim.g.vimtex_compiler_method = "latexmk"
  end,
  keys = {
    {
      "<leader>vtc",
      "<cmd>VimtexCompile<cr>",
      desc = "Compile toggle LaTeX document",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
    {
      "<leader>vtt",
      "<cmd>VimtexTocToggle<cr>",
      desc = "Toggle table of content",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
    {
      "<leader>vtx",
      "<cmd>VimtexClean<cr>",
      desc = "Clean LaTeX document",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
  },
}
