# My Neovim Configurations in Lua
This is my Neovim setup on Window.

## Forewords
Most of my set up are basing on [Chris@Machine Neovim setup](https://github.com/ChristianChiarulli/nvim).__
The only difference is that I don't do code completion and native lsp but instead I'm relying on Coc.nvim __
since I'm pretty new to Neovim and coding everything in Lua is taking up a lot of my time. I'll eventually __
move back to native lsp setup when I got the chance.

## Requirements
In this Lua setup, I'm using Packer to manage all of my plugins. You can install Packer [here](https://github.com/wbthomason/packer.nvim#quickstart)

Also make sure that you have Visual CMake and also Microsoft Visual C++ build tools install since I'm using [telescoe-fzf-native plugins.](https://github.com/nvim-telescope/telescope-fzf-native.nvim)__
Without it, the installation of this package will failed.

To install Microsoft Visual C++, this can be through Visual Studio if you have it. To install CMake, this can be downloaded at CMake's [download site](https://cmake.org/download/)

## Setup
Once you've made sure that all requirements are installed, you can go ahead and run this command:

    :PackerInstall

After running install, you can run this command to check the health of all installed packages:
    
    :checkhealth


## FAQ
### Q: Why do I see telescope require fd after running checkhealth?
This is because telescope requires fd for some of its operation but this is not require for the existing functionality used in this repo as far as I know. You can however install fd on Window through [this page](https://github.com/sharkdp/fd#installation)

### Q: Why do I see error for tree-sitter cannot find cc or gcc or clang after running checkhealth?
You will need to follow [this instruction](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support) on nvim-treesitter to have Window supported 