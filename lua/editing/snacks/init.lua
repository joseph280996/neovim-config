local constants = require("utils.constants")
local dashboard_conf = require("editing.snacks.dashboard")
local picker_confs = require("editing.snacks.picker")
local scratch_confs = require("editing.snacks.scratch")

local keys = {}

local picker_conf, picker_km = picker_confs.config, picker_confs.keys
local scratch_conf, scratch_km = scratch_confs.config, scratch_confs.keys

vim.list_extend(keys, picker_km)
vim.list_extend(keys, scratch_km)

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    lazygit = { enabled = false },
    bigfile = { enabled = false },
    dashboard = dashboard_conf,
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    scratch = scratch_conf,
    picker = picker_conf,
  },
  keys = keys,
}
