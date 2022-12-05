local ok, _ = pcall(require, 'lspconfig')
if not ok then
    return
end

require('user.lsp.mason')
require('user.lsp.handlers').setup()
require('user.lsp.null-ls')

vim.cmd [[ 
    augroup _lsp
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.formatting()
    augroup end
]]
