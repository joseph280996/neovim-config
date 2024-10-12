return {
  "williamboman/mason.nvim", -- Simple to use LSP installer
  cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonInstallAll" },
  opts = {
    ui = {
      border = "none",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  },
}
