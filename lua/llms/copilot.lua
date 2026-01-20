return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      copilot_node_command = "/Users/tpham4/.local/share/nvm/v22.21.1/bin/node",
      panel = { enabled = false },
      suggestion = { enabled = false },
      nes = {
        enabled = false
      },
      filetypes = {
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        markdown = true,
        lua = true,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            -- disable for .env files
            return false
          end
          return true
        end,
        ["*"] = false,
      },
    },
  },
}
