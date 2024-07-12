-- This is mainly for Neovim config and made vim or require
-- not throwing an error
return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
          'on',
          'enable',
          'pairs',
          'ipairs',
          'pcall'
        }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false
      }
    }
  }
}
