local options = {
    -- {{ Neovim Config }}
    number = true,          -- Enable line number
    relativenumber = true,  -- Enable relative number from current line
    termguicolors = true,   -- Enable colors for color scheme
    encoding = 'utf-8',     -- Set files encoding to display icons
    fileencoding = 'utf-8', -- Set encoding written to a file
    wrap = false,           -- Prevent vim from breakign a long line into multiple lines
    smartcase = true,
    exrc = true,            -- Allows loading local rc files
    secure = true,          -- Disallow the use of :autocmd
    swapfile = false,       -- Disable creation of swap file
    cursorline = true,      -- Highlighting current line
    compatible = false,

    -- {{ Fold Config }}
    foldmethod = 'indent',  -- Fold all functiosn and other blocks automatically
    foldlevel = 99,         -- Unfold on open

    -- {{ Tab Config }}
    expandtab = true,
    smarttab = true,
    tabstop = 4,
    shiftwidth = 4
}

for setting, value in pairs(options) do
    vim.opt[setting] = value
end

vim.g.python3_host_prog = '~/AppData/Local/Programs/Python/Python310/python3.exe'