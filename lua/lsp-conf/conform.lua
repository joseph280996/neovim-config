return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      json = { "prettier" },
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      python = { "ruff_format" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      sql = { "sqlfluff" },
      java = { "google-java-format" },
      tex = { "tex-fmt" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Customize formatters
    formatters = {
      ["clang-format"] = {
        append_args = {
          "-style=file",
        },
      },
      prettier = {
        append_args = {
          "--use-tabs",
          "--tab-width",
          4,
          "--print-width",
          180,
          "--quote-props",
          "preserve",
        },
      },
      prettierd = {
        append_args = {
          "--use-tabs",
          "--tab-width",
          4,
          "--print-width",
          180,
          "--quote-props",
          "preserve",
        },
      },
      sqlfluff = {
        append_args = {
          "--config",
          vim.fn.stdpath("config") .. "/formatter-conf/.sqlfluff",
        },
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "n",
      desc = "File Format",
    },
  },
}
