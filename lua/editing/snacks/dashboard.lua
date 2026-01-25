local constants = require("utils.constants")
local get_values_on_os = require("utils.get-values-on-os")

local icons = require("utils.constants.icons")
local image_getter = require("utils.get-dashboard-image").getImageByHour

local IMAGE_PATH = get_values_on_os({
  [constants.WINDOW] = constants.IMAGE_PATH_WIN,
  [constants.LINUX] = constants.IMAGE_PATH_LINUX,
  [constants.DARWIN] = constants.IMAGE_PATH_DARWIN,
})

return {
  width = 60,
  row = nil, -- dashboard position. nil for center
  col = nil, -- dashboard position. nil for center
  pane_gap = 4,
  autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
  -- These settings are used by some built-in sections
  preset = {
    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
    ---@type fun(cmd:string, opts:table)|nil
    pick = nil,
    -- Used by the `keys` section to show keymaps.
    -- Set your custom keymaps here.
    -- When using a function, the `items` argument are the default keymaps.
    ---@type snacks.dashboard.Item[]
    keys = {
      {
        icon = " ",
        desc = "Browse Repo",
        padding = 1,
        key = "b",
        action = function()
          Snacks.gitbrowse()
        end,
      },
      {
        icon = icons.git.Repo .. " ",
        key = "p",
        desc = "Find Projects",
        action = ":lua Snacks.dashboard.pick('projects')",
      },
      {
        icon = icons.ui.Search .. " ",
        key = "f",
        desc = "Find File",
        action = ":lua Snacks.dashboard.pick('files')",
      },
      {
        icon = icons.ui.NewFile .. " ",
        key = "n",
        desc = "New File",
        action = ":ene | startinsert",
      },
      {
        icon = icons.ui.List .. " ",
        key = "g",
        desc = "Find Text",
        action = ":lua Snacks.dashboard.pick('live_grep')",
      },
      {
        icon = icons.documents.Files .. " ",
        key = "r",
        desc = "Recent Files",
        action = ":lua Snacks.dashboard.pick('oldfiles')",
      },
      {
        icon = icons.ui.Gear .. " ",
        key = "c",
        desc = "Config",
        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
      },
      { icon = icons.ui.SignOut .. " ", key = "q", desc = "Quit", action = ":qa" },
    },
    -- Used by the `header` section
  },
  -- item field formatters
  sections = {
    { section = "header", indent = 2, gap = 1, padding = 1 },
    { section = "keys", indent = 2, gap = 1, padding = 1 },
    {
      icon = icons.documents.File .. " ",
      title = "Recent Files",
      section = "recent_files",
      indent = 2,
      padding = 1,
    },
    function()
      local in_git = Snacks.git.get_root() ~= nil
      local cmds = {
        {
          icon = " ",
          title = "Git Status",
          cmd = "git --no-pager diff --stat -B -M -C",
          height = 10,
        },
      }
      return vim.tbl_map(function(cmd)
        return vim.tbl_extend("force", {
          section = "terminal",
          enabled = in_git,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        }, cmd)
      end, cmds)
    end,
    { section = "startup" },
    {
      pane = 2,
      section = "terminal",
      cmd = "chafa "
        .. image_getter(IMAGE_PATH)
        .. " --format symbols --symbols vhalf --size 96x27 --stretch",
      width = 96,
      height = 27,
      padding = 1,
    },
  },
}
