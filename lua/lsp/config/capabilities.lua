local status_cmp_ok, blink_cmp = pcall(require, "blink.cmp")
if not status_cmp_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities = blink_cmp.get_lsp_capabilities(capabilities)

return capabilities
