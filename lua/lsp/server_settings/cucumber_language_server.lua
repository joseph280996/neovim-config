return {
  filetypes = { "cucumber" },
  cmd_env = {
    ASDF_NODEJS_VERSION = "18.16.0",
  },
  cmd_cwd = nil,
  root_dir = vim.fs.dirname(
    vim.fs.find({ "package.json", "package-lock.json", "node_modules" }, { upward = true })[1]
  ),
}
