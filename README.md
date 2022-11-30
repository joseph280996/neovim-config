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

## Setup
Once you've made sure that all requirements are installed, you can go ahead and run this command:

    :PackerInstall
