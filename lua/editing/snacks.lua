local constants = require("utils.constants")
local icons = require("utils.constants.icons")
local get_values_on_os = require("utils.get-values-on-os")
local image_getter = require("utils.get-dashboard-image").getImageByHour

local KEYBINDING_OPTS = constants.KEYBINDING_OPTS
local IMAGE_PATH = get_values_on_os({
  [constants.WINDOW] = constants.IMAGE_PATH_WIN,
  [constants.LINUX] = constants.IMAGE_PATH_LINUX,
})

local custom_layout = {
  preset = "vscode",
  layout = {
    [2] = { win = "list", border = "rounded" },
  },
}

local picker_conf = {
  enabled = true,
  sources = {
    explorer = {
      auto_close = true,
      layout = {
        preset = "left",
        layout = {
          min_width = 20,
        },
      },
    },
    smart = {
      layout = vim.tbl_deep_extend("keep", { preview = "main" }, custom_layout),
      filter = { cwd = true },
    },
    project = { layout = custom_layout },
    lsp_definitions = {
      layout = custom_layout,
    },
    lsp_declarations = {
      layout = custom_layout,
    },
    lsp_symbols = {
      layout = custom_layout,
      filter = {
        lua = true,
      },
    },
  },
  matcher = {
    cwd_bonus = true,
  },
}

local dashboard_conf = {
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
    header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████]],
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
    { section = "startup" },
    {
      pane = 2,
      section = "terminal",
      cmd = "chafa "
        .. image_getter(IMAGE_PATH)
        .. " --format symbols --symbols vhalf --size 96x27 --stretch",
      width = 128,
      height = 36,
      padding = 1,
    },
  },
}

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
    explorer = {
      enabled = true,
      replace_netrw = false,
    },
    indent = { enabled = false },
    image = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    picker = picker_conf,
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>xf",
      function()
        Snacks.explorer()
      end,
      desc = "Open File Explorer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>xo",
      function()
        Snacks.picker.lsp_symbols({
          layout = {
            preset = "right",
          },
        })
      end,
      desc = "Open Symbols Explorer",
    }, KEYBINDING_OPTS),

    -- Find
    vim.tbl_deep_extend("force", {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ff",
      function()
        Snacks.picker.smart()
      end,
      desc = "Files",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fs",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ft",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find Text",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fT",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Find Text in Open Bufferes",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      mode = { "n", "x" },
      desc = "Find Word under cursor or selection",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fR",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Find Projects",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ur",
      function()
        Snacks.picker.resume()
      end,
      desc = "Last Telescope Actions",
    }, KEYBINDING_OPTS),

    -- LSP
    vim.tbl_deep_extend("force", {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Go to Definition",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Go to Declaration",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "gri",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Go To Implementation",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "grr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "Go To References",
    }, KEYBINDING_OPTS),

    -- Utilities
    vim.tbl_deep_extend("force", {
      "<leader>uu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo Tree",
    }, KEYBINDING_OPTS),
  },
}
