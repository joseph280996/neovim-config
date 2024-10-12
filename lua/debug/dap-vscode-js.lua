return {
  "mxsdev/nvim-dap-vscode-js",
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  dependencies = {
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local js_debug_path =
      require("mason-registry").get_package("js-debug-adapter"):get_install_path()

    require("dap-vscode-js").setup({
      debugger_path = js_debug_path,
      adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
      debugger_cmd = { "js-debug-adapter" },
    })
    local dap = require("dap")
    if dap.configurations.typescript == nil and dap.configurations.javascript == nil then
      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
        }
      end
    end
  end,
}
