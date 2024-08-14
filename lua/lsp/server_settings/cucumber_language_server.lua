return {
  filetypes = { "cucumber" },
  cmd_env = {
    ASDF_NODEJS_VERSION = "18.16.0",
  },
  cmd_cwd = nil,
  root_dir = require("lspconfig.util").find_package_json_ancestor,
}
