local lsp_keymaps = require("plugins.lsp.utils.keymap")

return function(client, bufnr)
  if client.name == "ruff_lsp" then
    client.server_capabilities.hoverProvider = false
  end

  lsp_keymaps(bufnr)
end

