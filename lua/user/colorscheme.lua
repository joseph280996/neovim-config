-- local colorscheme = 'iceberg'
-- local colorscheme = 'nord'
-- local colorscheme = 'poimandres'
-- local colorscheme = 'tokyonight-night'
local colorscheme = "nightfly"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    return
end
