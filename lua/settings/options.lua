local icons = require("utils.constants.icons")
local options = {
  -- {{ Neovim Config }}
  number = true, -- Enable line number
  relativenumber = true, -- Enable relative number from current line
  termguicolors = true, -- Enable colors for color scheme
  encoding = "utf-8", -- Set files encoding to display icons
  fileencoding = "utf-8", -- Set encoding written to a file
  wrap = false, -- Prevent vim from breakign a long line into multiple lines
  smartcase = true,
  exrc = true, -- Allows loading local rc files
  secure = true, -- Disallow the use of :autocmd
  swapfile = false, -- Disable creation of swap file
  cursorline = true, -- Highlighting current line
  compatible = false,
  endofline = false,

  -- {{ Fold Config }}
  foldlevel = 99, -- Unfold on open
  foldlevelstart = 99,
  foldenable = true,
  signcolumn = "yes",
  foldmethod = "expr",
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldtext = "",
  foldcolumn = "1",

  -- {{ Tab Config }}
  expandtab = true,
  smarttab = true,
  tabstop = 2,
  shiftwidth = 2,
  cmdheight = 0,

  -- {{ Split Config }}
  splitbelow = true,
  splitright = true,
}

for setting, value in pairs(options) do
  vim.opt[setting] = value
end

vim.opt.fillchars:append({
  fold = " ",
  foldclose = icons.ui.ArrowClosed,
  foldopen = icons.ui.ArrowOpen,
})

vim.g.python3_host_prog = "python"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.lasttab = 1

vim.cmd([[set clipboard=unnamedplus]])
