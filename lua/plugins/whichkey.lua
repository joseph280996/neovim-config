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
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 30
  end,
  opts = {
    plugins = {
      mark = false,
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments", ys = "Surround" },
    window = {
      border = "rounded", -- none, single, double, shadow
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    keymaps_ext = {
      [";"] = { "<cmd>Alpha<cr>", "Alpha" },
      ["<F5>"] = { "<cmd>lua require('dap').continue()<cr>", "Debug Start/continue" },
      ["<F10>"] = { "<cmd>lua require('dap').step_over()<cr>", "Debug Step Over" },
      ["<F11>"] = { "<cmd>lua require('dap').step_into()<cr>", "Debug Step Into" },
      ["<F12>"] = { "<cmd>lua require('dap').step_out()<cr>", "Debug Step Out" },
      b = {
        name = "Buffers",
        x = { "<cmd>bdelete!<CR>", "Close Buffer" },
      },
      d = {
        name = "Debug",
        b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        l = { "<cmd>lua require('dap').run_last()<cr>", "Run Last" },
        u = { "<cmd>lua require('dapui').toggle()<cr>", "UI" },
        r = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Run" },
        R = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle Repl" },
        x = { "<cmd>lua require('dap').terminate()<cr>", "Exit" },
      },
      f = {
        name = "Find",
        a = { "<cmd>Telescope pickers<cr>", "Telescope Actions" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        f = {
          "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
          "Files",
        },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        n = { "<cmd>lua require('notify').history()<cr>", "Find Noti" },
        p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Find Projects" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        s = { "<cmd>SearchSession<cr>", "Find Session" },
        t = {
          "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
          "Find Text",
        },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
      },
      g = { name = "Git" },
      l = {
        name = "LSP",
        d = {
          "<cmd>Telescope diagnostics bufnr=0<cr>",
          "Document Diagnostics",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        f = { "Fix" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        w = {
          "<cmd>Telescope diagnostics<cr>",
          "Workspace Diagnostics",
        },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
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
      u = { name = "Utilities" },
      x = { name = "Explorer" },
      S = { name = "Session" },
      T = {
        name = "Unit Testing",
        R = { name = "Run" },
        W = { name = "Watch" },
      },
    },
    keymaps_visual_ext = {},
  },
  config = function(_, opts)
    local whichkey = require("which-key")
    whichkey.setup(opts)
    -- TODO: Refactor this to each separate plugins
    whichkey.register(opts.keymaps_ext, normal_keymap_opts)
    whichkey.register(opts.keymaps_visual_ext, visual_keymap_opts)
  end,
}
