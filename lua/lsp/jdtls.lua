return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local get_value_on_os = require("utils.get-values-on-os")
    local jdtls = require("jdtls")
    local wk = require("which-key")

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
        { Window = "config_win", Linux = "config_linux", MacOS = "config_mac" },
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
      capabilities = require("utils.lsp.capabilities"),
      on_attach = function()
        require("jdtls.dap").setup_dap_main_class_configs()
        jdtls.setup_dap({ hotcodereplace = "auto" })
        local map = vim.keymap.set
        map("n", "gD", vim.lsp.buf.declaration, { silent = true, buffer = true })
        map("n", "gd", vim.lsp.buf.definition, { silent = true, buffer = true })
        map("n", "K", vim.lsp.buf.hover, { silent = true, buffer = true })
        map("n", "<Leader>dj", vim.diagnostic.goto_next, { buffer = true })
        map("n", "<Leader>dk", vim.diagnostic.goto_prev, { buffer = true })
        map("n", "<Leader>dl", require("telescope.builtin").diagnostics, { buffer = true })
        map("n", "<Leader>lr", vim.lsp.buf.rename, { buffer = true })
        map("n", "<Leader>c", vim.lsp.buf.code_action, { buffer = true })
        map("n", "<Leader>lf", vim.lsp.buf.formatting, { silent = true, noremap = true })
        wk.register({
          j = {
            name = "Java",
            t = {
              name = "Test",
              c = { jdtls.test_class, "Test class" },
              n = { jdtls.test_nearest_method, "Test nearest method" },
            },
            e = {
              name = "Extract",
              v = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Variables" },
              m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Methods" },
            },
            i = {
              name = "Import",
              o = { jdtls.organize_imports, "Organize" },
            },
          },
        }, {
          prefix = "<leader>",
        })
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
