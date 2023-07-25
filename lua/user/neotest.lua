local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      runner = "pytest",
    }),
    require("neotest-dotnet")({
      dap = { justMyCode = false },
      discovery_root = "solution",
    }),
  },
})

local M = {}
M.debug_nearest_test = function()
  neotest.run.run({
    strategy = "dap",
  })
end

return M
