return {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = { "ConformInfo" },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      json = { "prettier" },
      lua = { "stylua" },
      c = { "clang-format" },
      python = { "ruff_format" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      sql = { "sqlfluff" },
      java = { "google-java-format" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Customize formatters
    formatters = {
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
          vim.fn.stdpath("config") .. "/lua/lsp/formatter_conf/.sqlfluff",
        },
      },
    },
  },
}
