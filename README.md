# My Neovim Configurations in Lua
This is my Neovim setup on Window.

## Forewords
Most of my set up are basing on [Chris@Machine Neovim setup](https://github.com/ChristianChiarulli/nvim). However, with current archiving notice from null-ls, I'm still undecided on what to use and will figure it out soon.

## Requirements
In this Lua setup, I'm using [lazy.nvim](https://github.com/folke/lazy.nvim) to manage all of my plugins.

Also make sure that you have Visual CMake and also Microsoft Visual C++ build tools install since I'm using [telescope-fzf-native plugins.](https://github.com/nvim-telescope/telescope-fzf-native.nvim).
Without it, the installation of this package will failed.

To install Microsoft Visual C++, this can be through Visual Studio if you have it. To install CMake, this can be downloaded at CMake's [download site](https://cmake.org/download/)

## FAQ
### Q: Why do I see telescope require fd after running checkhealth?
This is because telescope requires fd for some of its operation but this is not require for the existing functionality used in this repo as far as I know. You can however install fd on Window through [this page](https://github.com/sharkdp/fd#installation)

### Q: Why do I see error for tree-sitter cannot find cc or gcc or clang after running checkhealth?
You will need to follow [this instruction](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support) on nvim-treesitter to have Window supported 

## P.S:
This is the README after I put everything together so I can't recall most of it up top of my head but feel free to reach out or create issue for question and I'll update the README for further clarification.
