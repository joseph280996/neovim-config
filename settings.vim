"{{ Configuring Neovim }}
syntax on                               "Enable syntax highlighting
set number                              "Enable line number
set relativenumber                      "Enable relative line number
set nocompatible
set termguicolors                       "Enable colors for color scheme
set encoding=utf-8                      "Set files encoding to display icons
set nowrap                              "Prevent vim from breaking a long line into multiple lines
colorscheme iceberg                      "Set color scheme
set smartcase
set exrc                                "Allows loading local rc files
set secure                              "Disallow the use of :autocmd

"{{ Fold Configuring }}
set foldmethod=indent                   "Fold all functions and other blocks automatically
set foldlevel=99                        "Unfold on open
set ffs=unix,dos,mac                    "Use Unix as the standard file type

"{{ <Tab> Configuring }}
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
