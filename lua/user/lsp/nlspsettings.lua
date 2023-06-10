local status_ok, nlspsettings = pcall(require, "nlspsettings")
if not status_ok then
    return
end

nlspsettings.setup({
    config_home = vim.fn.stdpath('config') .. '/lua/user/lsp/settings',
    local_settings_dir = ".nlsp-settings",
    local_settings_root_markers_fallback = { '.git' },
    append_default_schemas = true,
    loader = 'json'
})