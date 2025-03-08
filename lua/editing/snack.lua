return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    pickers = {
      enabled = true,
      matcher = {
        cwd_bonus = true,
        frecency = true,
      },
    },
  },
  keys = {
    -- Find
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.smart({ layout = { preset = "vscode", preview = "main" } })
      end,
      desc = "Files",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.lsp_symbols({ layout = { preset = "vscode", preview = "main" } })
      end,
      desc = "LSP Symbols",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ft",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find Text",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fT",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Find Text in Open Bufferes",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      mode = { "n", "x" },
      desc = "Find Word under cursor or selection",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects({ layout = { preset = "vscode", preview = "main" } })
      end,
      desc = "Find Projects",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ur",
      function()
        Snacks.picker.resume()
      end,
      desc = "Last Telescope Actions",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },

    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions({ layout = { preset = "vscode" } })
      end,
      desc = "Go to Definition",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations({ layout = { preset = "vscode" } })
      end,
      desc = "Go to Declaration",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Go To Implementation",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "Go To References",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
