local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
local custom_layout = {
  preview = false,
  layout = {
    backdrop = false,
    row = 1,
    width = 0.4,
    min_width = 80,
    height = 0.4,
    border = "none",
    box = "vertical",
    {
      win = "input",
      height = 1,
      border = "rounded",
      title = "{title} {live} {flags}",
      title_pos = "center",
    },
    { win = "list", border = "rounded" },
    { win = "preview", title = "{preview}", border = "rounded" },
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
    dashboard = { enabled = false },
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
    picker = {
      enabled = true,
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            preview = "main",
            layout = {
              backdrop = false,
              width = 40,
              min_width = 20,
              height = 0,
              position = "left",
              border = "none",
              box = "vertical",
              {
                win = "input",
                height = 1,
                border = "rounded",
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", height = 0.4, border = "top" },
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
      },
      matcher = {
        cwd_bonus = true,
      },
    },
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>xf",
      function()
        Snacks.explorer()
      end,
      desc = "Open File Explorer",
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
