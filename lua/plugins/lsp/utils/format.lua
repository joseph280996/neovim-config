local status_nullls_ok, null_ls = pcall(require, "null-ls")
if not status_nullls_ok then
  return
end

local status_nullls_sources_ok, null_ls_sources = pcall(require, "null-ls.sources")
if not status_nullls_sources_ok then
  return
end

local function format_filter(client)
  local filetype = vim.bo.filetype
  local method = null_ls.methods.FORMATTING
  local available_formatters = null_ls_sources.get_available(filetype, method)

  if #available_formatters > 0 then
    return client.name == "null-ls"
  elseif client.supports_method("textDocument/formatting") then
    return true
  else
    return false
  end
end

return function()
  vim.lsp.buf.format({
    filter = format_filter,
    timeout_ms = 8000,
  })
end
