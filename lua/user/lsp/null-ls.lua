local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    source = {
        formatting.eslint,
        formatting.prettier_d_slim.with({ extra_args = { "--arrow_parens avoid", "--end-of-line auto" } }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
    },
})
