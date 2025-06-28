return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "RRethy/nvim-treesitter-textsubjects",
  },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    auto_install = true,
    ensure_installed = {
      "yaml",
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
    textsubjects = {
      enable = true,
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ["i;"] = {
          "textsubjects-container-inner",
          desc = "Select inside containers (classes, functions, etc.)",
        },
      },
    },
  },
  build = ":TSUpdate",
  config = function(_, opts)
    local ts_configs = require("nvim-treesitter.configs")
    local ts_install = require("nvim-treesitter.install")

    ts_install.prefer_git = false
    ts_install.compilers = { "clang", "gcc" }

    ts_configs.setup(opts)
  end,
}
