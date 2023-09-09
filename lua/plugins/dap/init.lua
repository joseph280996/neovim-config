return {
  -- DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")

      local install_dir = vim.fn.stdpath("data")

      -- DAP ADAPTERS CONFIG
      dap.adapters.coreclr = {
        type = "executable",
        command = install_dir .. "/mason/packages/netcoredbg/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      -- DAP LANG CONFIG
      local mappings = {
        chrome = { "typescript", "javascript" },
        ["pwa-chrome"] = { "typescript", "javascript" },
        node = { "typescript", "javascript" },
        ["pwa-node"] = { "typescript", "javascript" },
        python = { "python" },
      }

      require("dap.ext.vscode").load_launchjs(nil, mappings)

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
      )
      vim.fn.sign_define(
        "DapLogPoint",
        { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" }
      )
    end,
  },
  require("plugins.dap.dapui"),
  require("plugins.dap.dap-python"),
  require("plugins.dap.dap-vscode-js"),
}
