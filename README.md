# My Neovim Configurations in Lua

This is my Neovim setup on both Window, Linux and MacOS.
I don't use tab because I leave it to Wezterm to handle.

## Roadmap

- Remove session management and migrate to wezterm.
- Current consideration of using Zellij for better robust session management.

## Prerequisite

If you're using Java, make sure you have these installed on your machine:

- junit
- gson
- hamcrest

## Installation

Some packages have other package dependencies that can't be installed using Mason or Lazy.nvim and need manual installation using your system package manager

If you're using Linux, you can install these using Brew:

```bash
brew bundle
```

## FAQ

### Q: Why do I see telescope require fd after running checkhealth?

This is because telescope requires fd for some of its operation but this is not require for the existing functionality used in this repo as far as I know. You can however install fd on Window through [this page](https://github.com/sharkdp/fd#installation)

### Q: Why do I see error for tree-sitter cannot find cc or gcc or clang after running checkhealth?

You will need to follow [this instruction](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support) on nvim-treesitter to have Window supported

## P.S:

This is the README after I put everything together so I can't recall most of it up top of my head but feel free to reach out or create issue for question and I'll update the README for further clarification.
