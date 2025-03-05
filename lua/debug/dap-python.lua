local get_values_on_os = require("utils.get-values-on-os")
local constants = require("utils.constants")

return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local debugpy_path = require("mason-registry").get_package("debugpy"):get_install_path()
    local debugpy_py_path = get_values_on_os({
      [constants.WINDOW] = "/venv/Scripts/python",
      [constants.LINUX] = "/venv/bin/python",
    }, true)

    require("dap-python").setup(debugpy_path .. debugpy_py_path)

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
