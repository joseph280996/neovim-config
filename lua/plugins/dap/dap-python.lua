local get_values_on_os = require("user.utils.get-values-on-os").get_values_on_os

return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local debugpy_path = require("mason-registry").get_package("debugpy"):get_install_path()

    local debugpy_py_path = {
      Window = "/venv/Scripts/python",
      Linux = "/venv/bin/python",
    }

    require("dap-python").setup(debugpy_path .. get_values_on_os(debugpy_py_path, true))

    local dap = require("dap")

    if dap.configurations.python == nil then
      dap.configurations.python = {
        {
          name = "Launch file (Python)",
          type = "python",
          request = "launch",
          program = "${file}",
          console = "integratedTerminal",
          justMyCode = true,
        },
      }
    end
  end,
}
