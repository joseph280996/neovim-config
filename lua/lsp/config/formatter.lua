local function format_filter(client)
  local null_ls = require("null-ls")
  local null_ls_sources = require("null-ls.sources")

  local filetype = vim.bo.filetype
  local method = null_ls.methods.FORMATTING
  local available_formatters = null_ls_sources.get_available(filetype, method)

  if #available_formatters > 0 then
    return client.name == "null-ls"
  else
    return client.supports_method("textDocument/formatting")
  end
end

return function()
  vim.lsp.buf.format({
    filter = format_filter,
    timeout_ms = 8000,
  })
end
