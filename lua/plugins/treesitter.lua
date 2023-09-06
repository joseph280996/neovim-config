return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "kevinhwang91/nvim-ufo",
  },
  opts = {
    auto_install = true,
    ensure_installed = {
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
      "html",
    },
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "latex" },
      additional_vim_regex_highlighting = false,
    },
    autotag = {
      enable = true,
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
    local get_values_on_os = require("user.utils.get-values-on-os").get_values_on_os
    ts_install.prefer_git = get_values_on_os({ Window = false, Linux = false }, true)
    ts_install.compilers = { "clang", "gcc" }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
      group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
      callback = function()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      end,
    })

    ts_configs.setup(opts)
  end,
}
