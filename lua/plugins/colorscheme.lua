return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  opts = {
    compile = false, -- enable compiling the colorscheme
    undercurl = false, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = { -- add/modify theme and palette colors
      palette = {},
      theme = {
        wave = {
          syn = {
            parameter = "#b8b4d0",
          },
        },
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function(colors) -- add/modify highlights
      local theme = colors.theme
      local palette = colors.palette
      local makeDiagnosticColor = function(color)
        local color_utils = require("kanagawa.lib.color")
        return { fg = color, bg = color_utils(color):blend(theme.ui.bg, 0.95):to_hex() }
      end
      return {
        DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
        DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
        DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
        DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

        LspSignatureActiveParameter = makeDiagnosticColor(theme.diag.warning),
        ["@variable.parameter"] = { bg = theme.ui.bg, fg = theme.syn.parameter },
        ["@lsp.type.parameter"] = { bg = theme.ui.bg, fg = theme.syn.parameter },
      }
    end,
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd("colorscheme kanagawa-wave")
  end,
  --[[ "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function(_, opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end, ]]
}
