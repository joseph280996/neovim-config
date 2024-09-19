return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    auto_install = true,
    ensure_installed = {
      "http",
      "c",
      "vimdoc",
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
      "regex"
    },
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "latex", "cucumber" },
      additional_vim_regex_highlighting = false,
    },
    autotag = {
      enable = true,
      enable_close = true,
      enable_close_on_slash = true,
      filetypes = {
        "html",
        "xml",
        "cs",
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
      },
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function(_, opts)
    local ts_configs = require("nvim-treesitter.configs")
    local ts_install = require("nvim-treesitter.install")
    local get_values_on_os = require("utils.get-values-on-os")
    ts_install.prefer_git = get_values_on_os({ Window = false, Linux = false }, true)
    ts_install.compilers = { "clang", "gcc" }

    ts_configs.setup(opts)
  end,
}
