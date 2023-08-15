return {
  "tamago324/nlsp-settings.nvim",
  opts = {
    config_home = vim.fn.stdpath("config") .. "/lua/plugins/lsp/settings",
    local_settings_dir = ".nlsp-settings",
    local_settings_root_markers_fallback = { ".git" },
    append_default_schemas = true,
    loader = "json",
  },
}
