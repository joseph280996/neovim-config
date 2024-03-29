return {
  "folke/which-key.nvim", -- Centralized list of all commands UI
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments", ys = "Surround" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    -- triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  },
  config = function(_, opts)
    local comment_cmd = require("user.comment")
    local whichkey = require("which-key")
    whichkey.setup(opts)
    local normal_keymap_opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
    -- TODO: Refactor this to each separate plugins
    whichkey.register({
      [";"] = { "<cmd>Alpha<cr>", "Alpha" },
      ["<F5>"] = { "<cmd>lua require('dap').continue()<cr>", "Debug Start/continue" },
      ["<F10>"] = { "<cmd>lua require('dap').step_over()<cr>", "Debug Step Over" },
      ["<F11>"] = { "<cmd>lua require('dap').step_into()<cr>", "Debug Step Into" },
      ["<F12>"] = { "<cmd>lua require('dap').step_out()<cr>", "Debug Step Out" },
      b = {
        name = "Buffers",
        e = { "<cmd>Neotree show buffers reveal<cr>", "Explorer Opened Buffers" },
        h = { "<cmd>FocusSplitLeft<cr>", "Focus Left" },
        j = { "<cmd>FocusSplitDown<cr>", "Focus Down" },
        k = { "<cmd>FocusSplitUp<cr>", "Focus Up" },
        l = { "<cmd>FocusSplitRight<cr>", "Focus Right" },
        c = { "<cmd>bdelete!<CR>", "Close Buffer" },
        t = {
          name = "Terminal",
          o = {
            name = "Open",
            n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
            t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
            u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
            P = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
            f = { "<cmd>lua _PS_FLOAT_TOGGLE()<cr>", "Float" },
            h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
            v = { "<cmd>lua _PS_VERTICAL_TOGGLE()<cr>", "Vertical" },
            p = {
              name = "Powershell",
              f = { "<cmd>lua _PS_FLOAT_TOGGLE()<cr>", "Float" },
              h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
              v = { "<cmd>lua _PS_VERTICAL_TOGGLE()<cr>", "Vertical" },
            },
            b = {
              name = "Bash",
              f = { "<cmd>lua _GB_FLOAT_TOGGLE()<cr>", "Float" },
              h = { "<cmd>lua _GB_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
              v = { "<cmd>lua _GB_VERTICAL_TOGGLE()<cr>", "Vertical" },
            },
          },
          n = {
            name = "New",
            f = { "<cmd>lua _PS_FLOAT_TOGGLE_NEW_SESSION()<cr>", "Float" },
            h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE_NEW_SESSION()<cr>", "Horizontal" },
            v = { "<cmd>lua _PS_VERTICAL_TOGGLE_NEW_SESSION()<cr>", "Vertical" },
            p = {
              name = "Powershell",
              f = { "<cmd>lua _PS_FLOAT_TOGGLE_NEW_SESSION()<cr>", "Float" },
              h = { "<cmd>lua _PS_HORIZONTAL_TOGGLE_NEW_SESSION()<cr>", "Horizontal" },
              v = { "<cmd>lua _PS_VERTICAL_TOGGLE_NEW_SESSION()<cr>", "Vertical" },
            },
            b = {
              name = "Bash",
              f = { "<cmd>lua _GB_FLOAT_TOGGLE()<cr>", "Float" },
              h = { "<cmd>lua _GB_HORIZONTAL_TOGGLE()<cr>", "Horizontal" },
              v = { "<cmd>lua _GB_VERTICAL_TOGGLE()<cr>", "Vertical" },
            },
          },
        },
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
        x = {
          name = "Explorer",
          f = { "<cmd>Neotree focus filesystem reveal<cr>", "Open/Focus on the Explorer" },
          x = { "<cmd>Neotree close<cr>", "Close the Explorer" },
          o = { "<cmd>AerialToggle!<cr>", "Outline" },
        },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
      },
      g = {
        name = "Git",
        d = {
          "<cmd>DiffviewOpen<cr>",
          "Git Diffview",
        },
        h = {
          name = "History",
          f = { "<cmd>DiffviewFileHistory<cr>", "File" },
        },
      },
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        c = {
          "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
          "Linewise Toggle Commenting",
        },
        d = {
          "<cmd>Telescope diagnostics bufnr=0<cr>",
          "Document Diagnostics",
        },
        f = { require("plugins.lsp.handlers").lsp_formatting, "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = {
          "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
          "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        t = {
          name = "Trouble",
          d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Troubles in Buffer" },
          f = { "<cmd>TroubleToggle quickfix<cr>", "Trouble Quickfix" },
          l = { "<cmd>TroubleToggle loclist<cr>", "Trouble in LocList" },
          o = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
          r = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble LSP refs" },
          w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Troubles in Workspace" },
        },
        w = {
          "<cmd>Telescope diagnostics<cr>",
          "Workspace Diagnostics",
        },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
      n = {
        name = "Notes",
        w = {
          name = "Workspace",
          w = { "<cmd>Neorg workspace work<cr>", "Work" },
          s = { "<cmd>Neorg workspace school<cr>", "School" },
          p = { "<cmd>Neorg workspace personal<cr>", "Personal" },
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
        m = { "<cmd>MarkdownPreview<cr>", "Preview Markdown" },
      },
      t = {
        name = "Tabs",
        c = { "<cmd>tabclose<cr>", "Close Tab" },
        n = { "<cmd>tabnew<cr>", "New Tab" },
      },
      v = {
        name = "Vim packages",
        t = {
          name = "Vimtex",
          c = { "<cmd>VimtexCompile<cr>", "Compile toggle LaTeX document" },
        },
      },
      S = {
        name = "Session",
        d = { "<cmd>SessionDelete<cr>", "Delete session" },
        r = { "<cmd>SessionRestore<cr>", "Restore session" },
        s = { "<cmd>SessionSave<cr>", "Save session" },
      },
      T = {
        name = "Unit Testing",
        D = { require("user.neotest").debug_nearest_test, "Debug Tests" },
        R = {
          name = "Run",
          R = { "<cmd>lua require('neotest').run.run()<cr>", "Test Under Cursor" },
          F = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Current File" },
          A = { "<cmd>lua require('neotest').run.run({ suite = true })<cr>", "All Tests" },
        },
        W = {
          name = "Watch",
          R = { "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>", "Start File" },
          S = { "<cmd>lua require('neotest').watch.stop()<cr>", "Stop" },
        },
        E = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle" },
        S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop Test Run" },
        O = {
          "<cmd>lua require('neotest').output_panel.toggle()<cr>",
          "Output",
        },
      },
    }, normal_keymap_opts)

    local visual_keymap_opts = {
      mode = "v", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
    whichkey.register({
      l = {
        name = "LSP",
        c = {
          name = "Comment",
          b = {
            comment_cmd.toggle_bwcomment_selection,
            "Blockwise Toggle",
          },
          l = {
            comment_cmd.toggle_lwcomment_selection,
            "Linewise Toggle",
          },
        },
      },
    }, visual_keymap_opts)
  end,
}
