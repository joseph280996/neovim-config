return {
  "mfussenegger/nvim-jdtls",
  config = function()
    local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
    local java_debug_adapter_path =
      require("mason-registry").get_package("java-debug-adapter"):get_install_path()

    local config = {
      cmd = {
        jdtls_path .. '/bin/jdtls.bat',
      },
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
          },
        },
      },
      init_options = {
        bundles = vim.fn.glob(
          java_debug_adapter_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
        ),
      },

      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,

      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
    }

    require("jdtls").start_or_attach(config)
  end,
}
