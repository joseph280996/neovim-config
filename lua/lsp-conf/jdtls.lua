local constants = require("utils.constants")
return {
  enabled = false,
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local get_value_on_os = require("utils.get-values-on-os")
    local jdtls = require("jdtls")
    local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
    local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local java_path = get_value_on_os({
      Window = "C:/Program Files/Java/jdk-20/bin/java",
      Linux = "/Library/Java/JavaVirtualMachines/jdk-20.jdk/Contents/Home/bin/java",
    })

    local debugger_path =
      require("mason-registry").get_package("java-debug-adapter"):get_install_path()

    local function get_config_dir()
      return get_value_on_os(
        { [constants.WINDOW] = "config_win", [constants.LINUX] = "config_linux", [constants.DARWIN] = "config_mac" },
        false
      )
    end

    local cmd = {
      java_path,
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1G",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      launcher_jar,
      "-configuration",
      vim.fs.normalize(jdtls_path .. "/" .. get_config_dir()),
      "-data",
      vim.fn.expand("~/.cache/jdtls-workspace/") .. workspace_dir,
    }

    jdtls.start_or_attach({
      cmd = cmd,
      capabilities = require("lsp.config.capabilities"),
      on_attach = function(_, bufnr)
        require("jdtls.dap").setup_dap_main_class_configs()
        jdtls.setup_dap({ hotcodereplace = "auto" })
        require("lsp.config.keymap")(bufnr)
      end,
      settings = {
        java = {
          project = {
            referencedLibraries = {
              "../jars/gson-2.10.1.jar",
              "../jars/hamcrest-2.2.jar",
              "../jars/junit-4.13.2.jar",
            },
          },
          configuration = {
            runtimes = {
              {
                name = "JavaSE-20",
                path = get_value_on_os({
                  Window = "C:/Program Files/Java/jdk-20",
                  Linux = "/Library/Java/JavaVirtualMachines/jdk-20.jdk/Contents/Home/",
                }, true),
              },
            },
          },
        },
      },
      init_options = {
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
        bundles = {
          vim.fn.glob(
            debugger_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
            true
          ),
        },
      },
      root_dir = vim.fs.dirname(
        vim.fs.find({ "gradlew", ".git", "mvnw", ".idea" }, { upward = true })[1]
      ),
    })
  end,
}
