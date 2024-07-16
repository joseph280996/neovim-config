local normal_keymap_opts = {
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  mode = "n", -- NORMAL mode
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local visual_keymap_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

return {
  "folke/which-key.nvim", -- Centralized list of all commands UI
  dependencies = {
    { "echasnovski/mini.icons", version = false },
  },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 30
  end,
  opts = {
    preset = "modern",
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments", ys = "Surround" },
    spec = {
      --[[ BUFFER OPEARTION ]]
      { "<leader>b", group = "Buffer" },
      { "<leader>bx", "<cmd>bdelete!<CR>", desc = "Close Buffer" },
      { "<leader>d", group = "Debug" },
      {
        "<leader>b",
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        desc = "Toggle Breakpoint",
      },
      { "<leader>l", "<cmd>lua require('dap').run_last()<cr>", desc = "Run Last" },
      { "<leader>u", "<cmd>lua require('dapui').toggle()<cr>", desc = "UI" },
      { "<leader>r", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Run" },
      { "<leader>R", "<cmd>lua require('dap').repl.toggle()<cr>", desc = "Toggle Repl" },
      { "<leader>x", "<cmd>lua require('dap').terminate()<cr>", desc = "Exit" },

      --[[ FIND OPERATION ]]
      { "<leader>f", group = "Find" },
      { "<leader>fa", "<cmd>Telescope pickers<cr>", desc = "Telescope Actions" },
      { "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        desc = "Files",
      },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>fn", "<cmd>lua require('notify').history()<cr>", desc = "Find Noti" },
      {
        "<leader>fp",
        "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
        desc = "Find Projects",
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
      { "<leader>fs", "<cmd>SearchSession<cr>", desc = "Find Session" },
      {
        "<leader>ft",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        desc = "Find Text",
      },
      { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },

      --[[ LSP OPERATIONS ]]
      {
        "<leader>l",
        group = "LSP",
      },
      { "<leader>ld ", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>ll ", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>lf", group = "Fix" },
      { "<leader>ls ", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lw ", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
      {
        "<leader>lS ",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Workspace Symbols",
      },

      { "<leader>g", group = "Git" },
      { "<leader>u", group = "Utilities" },
      { "<leader>x", group = "Explorer" },
      { "<leader>S", group = "Session" },

      --[[ UNIT TESTING ]]
      { "<leader>T", group = "Unit Testing" },
      { "<leader>TR ", group = "Run" },
      { "<leader>TW ", group = "Watch" },

      { "<leader>;", "<cmd>Alpha<cr>", desc = "Alpha" },

      --[[ DAP OPERATIONS ]]
      { "<leader><F5>", "<cmd>lua require('dap').continue()<cr>", desc = "Debug Start/continue" },
      { "<leader><F10>", "<cmd>lua require('dap').step_over()<cr>", desc = "Debug Step Over" },
      { "<leader><F11>", "<cmd>lua require('dap').step_into()<cr>", desc = "Debug Step Into" },
      { "<leader><F12>", "<cmd>lua require('dap').step_out()<cr>", desc = "Debug Step Out" },
    },
    keymaps_ext = {
      --[[]]
      p = {
        name = "Packages Manager",
        o = { "<cmd>Lazy<cr>", "Open Lazy Screen" },
        h = { "<cmd>Lazy health<cr>", "Health" },
      },
      q = {
        name = "Quick Access",
        r = {
          "Redo",
          s = { "<cmd>Telescope resume<cr>", "Last Telescope Actions" },
        },
      },
    },
    keymaps_visual_ext = {},
  },
  config = function(_, opts)
    local whichkey = require("which-key")
    whichkey.setup(opts)
    -- TODO: Refactor this to each separate plugins
    whichkey.add(opts.keymaps_ext, normal_keymap_opts)
    whichkey.add(opts.keymaps_visual_ext, visual_keymap_opts)
  end,
}
