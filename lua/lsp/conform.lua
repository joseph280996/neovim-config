return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_fmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettier" },
      sql = { "sqlfluff" },
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
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>lff",
      function()
        require("conform").format({ async = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
}
