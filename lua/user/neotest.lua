local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      runner = "pytest"
    }),
    require("neotest-dotnet")({
      dap = { justMyCode = false },
      discovery_root = 'solution'
    })
  }
})

local M = {}
M.debug_nearest_test = function ()
  if vim.bo.filetype == 'cs' then
    neotest.run.run({ 
      strategy = require('neotest-dotnet.strategies.netcoredbg'),
      is_custom_dotnet_debug = true
    })
  else
    neotest.run.run({
      strategy = 'dap'
    })
  end
end

return M
