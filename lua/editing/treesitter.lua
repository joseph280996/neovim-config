return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "RRethy/nvim-treesitter-endwise" },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    auto_install = true,
    ensure_installed = {
      "diff",
      "gitignore",
      "git_rebase",
      "gitcommit",
      "cmake",
      "vim",
      "http",
      "c",
      "vimdoc",
      "dockerfile",
      "sql",
      "java",
      "c_sharp",
      "bash",
      "javascript",
      "json",
      "lua",
      "python",
      "typescript",
      "css",
      "markdown",
      "markdown_inline",
      "html",
      "java",
      "regex",
    },
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {
        "latex", -- as this is done by vimtex
        "cucumber", -- TODO: Figure out how to have cucumber highlighting
      },
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = { "python", "css" },
    },
    endwise = {
      enable = true,
    },
  },
  build = ":TSUpdate",
  config = function(_, opts)
    local ts_configs = require("nvim-treesitter.configs")
    local ts_install = require("nvim-treesitter.install")
    local get_values_on_os = require("utils.get-values-on-os")
    ts_install.prefer_git = get_values_on_os({ Window = false, Linux = false }, true)
    ts_install.compilers = { "clang", "gcc" }

    ts_configs.setup(opts)
  end,
}
