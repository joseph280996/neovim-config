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
  timeoutlen = 1000,
  endofline = false,

  -- {{ Fold Config }}
  foldcolumn = "1",
  foldlevel = 99, -- Unfold on open
  foldlevelstart = 99,
  foldenable = true,
  signcolumn = "yes",

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

vim.g.python3_host_prog = "python"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.lasttab = 1

vim.cmd([[set clipboard=unnamedplus]])
