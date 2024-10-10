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
      markdown = { "prettierd", "prettier", stop_after_first = true },
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
    -- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  end,
}
