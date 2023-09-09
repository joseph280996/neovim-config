local get_values_on_os = require("user.utils.get-values-on-os").get_values_on_os

return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {
    "mfussenegger/nvim-dap",
    {
      "microsoft/vscode-js-debug",
      lazy = true,
      build = get_values_on_os({
        Linux = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        Window = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && Rename-Item -Path dist -NewName out",
      }, true),
    },
  },
  config = function()
    require("dap-vscode-js").setup({
      adapters = { "pwa-node" },
      debugger_cmd = { "js-debug-adapter" },
    })

    for _, language in ipairs({ "typescript", "javascript" }) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end
  end,
}
