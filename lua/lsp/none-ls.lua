return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    local formatting = null_ls.builtins.formatting
    local diagnostic = null_ls.builtins.diagnostics
    local codeaction = null_ls.builtins.code_actions

    null_ls.setup({
      debug = true,
      sources = {
        --[[Code Actions]]
        codeaction.proselint,

        --[[Diagnostics]]
        -- Markdown
        diagnostic.markdownlint.with({ extra_args = { "-r", "~MD013" } }),

        -- SQL
        diagnostic.sqlfluff.with({
          extra_args = {
            "--config",
            vim.fn.stdpath("config") .. "/lua/lsp/formatter_conf/.sqlfluff",
          },
        }),
        -- diagnostic.stylelint,

        --[[Formatting]]
        -- Python
        formatting.black,

        -- SQL
        formatting.sqlfluff.with({
          extra_args = {
            "--config",
            vim.fn.stdpath("config") .. "/lua/lsp/formatter_conf/.sqlfluff",
          },
        }),

        -- Lua
        formatting.stylua,
        formatting.prettier.with({
          extra_args = {
            "--config",
            vim.fn.stdpath("config") .. "/lua/lsp/formatter_conf/.prettierrc",
          },
        }),
      },
    })
  end,
}
