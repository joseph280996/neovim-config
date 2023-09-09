return {
  "mfussenegger/nvim-jdtls",
  config = function()
    local path = require("mason-registry").get_package("jdtls"):get_install_path()

    local config = {
      cmd = { path .. "/bin/jdtls" },
      root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    }

    require("jdtls").start_or_attach(config)
  end,
}
