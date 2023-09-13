# My Neovim Configurations in Lua

This is my Neovim setup on both Window, Linux and MacOS.

## Forewords

Most of my set up are basing on [Chris@Machine Neovim setup](https://github.com/ChristianChiarulli/nvim) with a little of extension in plugins that I use for better dev experience.
I used VSCode prior to this and enjoy the layout of VSCode so you'll see a lot of similarity in the UI that I have here.
However, I like the keymapping + ease of access of Neovim better and that result in the switch.

## Installation

Some packages have other package dependencies that can't be installed using Mason or Lazy.nvim and need manual installation using your system package manager

If you're using Linux, you can install these using Brew:

```bash
brew bundle
```

For Window, you can use

## FAQ

### Q: Why do I see telescope require fd after running checkhealth?

This is because telescope requires fd for some of its operation but this is not require for the existing functionality used in this repo as far as I know. You can however install fd on Window through [this page](https://github.com/sharkdp/fd#installation)

### Q: Why do I see error for tree-sitter cannot find cc or gcc or clang after running checkhealth?

You will need to follow [this instruction](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support) on nvim-treesitter to have Window supported

## P.S:

This is the README after I put everything together so I can't recall most of it up top of my head but feel free to reach out or create issue for question and I'll update the README for further clarification.
