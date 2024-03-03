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
        -- JavaScript
        codeaction.eslint,

        --[[Diagnostics]]
        -- Markdown
        diagnostic.markdownlint.with({ extra_args = { "-r", "~MD013" } }),

        -- LaTeX
        diagnostic.textidote,

        -- SQL
        diagnostic.sqlfluff.with({
          extra_args = {
            "--config",
            "~/AppData/Local/nvim/lua/plugins/lsp/formatter_conf/.sqlfluff",
          },
        }),

        --[[Formatting]]
        -- Python
        formatting.black,

        -- JavaScript
        formatting.eslint,

        -- SQL
        formatting.sqlfluff.with({
          extra_args = {
            "--config",
            "~/AppData/Local/nvim/lua/plugins/lsp/formatter_conf/.sqlfluff",
          },
        }),

        -- Lua
        formatting.stylua,

        -- LaTex and Markdown
        formatting.latexindent,
      },
    })
  end,
}
