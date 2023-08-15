return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    local formatting = null_ls.builtins.formatting
    local codeaction = null_ls.builtins.code_actions

    null_ls.setup({
      debug = true,
      sources = {
        codeaction.eslint,
        formatting.eslint,
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),
        formatting.stylua,
        formatting.latexindent,
        formatting.markdownlint
      },
    })
  end,
}
