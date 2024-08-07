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
    spec = {
      --[[ BUFFER OPEARTION ]]
      { "<leader>b", group = "Buffer" },
      { "<leader>bx", "<cmd>bdelete!<CR>", desc = "Close Buffer" },

      --[[ FIND OPs ]]
      { "<leader>f", group = "Find" },
      { "<leader>fa", "<cmd>Telescope pickers<cr>", desc = "Telescope Actions" },
      { "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
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
      {
        "<leader>ft",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        desc = "Find Text",
      },
      { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },

      { "<leader>g", group = "Git" },

      { "<leader>h", "<cmd>Hardtime toggle", desc = "Toggle Hardtime" },

      --[[ LSP OPs ]]
      { "<leader>l", group = "LSP" },
      { "<leader>lf", group = "Fix" },
      { "<leader>lt", group = "Trouble" },
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
      {
        "<leader>lS ",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Workspace Symbols",
      },

      { "<leader>u", group = "Utilities" },
      { "<leader>ur", "<cmd>Telescope resume<cr>", desc = "Last Telescope Actions" },

      { "<leader>x", group = "Explorer" },
      { "<leader>m", group = "Molten" },
      { "<leader>n", group = "Notes" },
      { "<leader>v", group = "Vim Packages" },
      { "<leader>vt", group = "VimTex" },
      { "<leader>s", group = "Surround" },

      --[[ UNIT TESTING ]]
      { "<leader>T", group = "Unit Testing" },
      { "<leader>TR ", group = "Run" },
      { "<leader>TW ", group = "Watch" },

      --[[ DAP OPs ]]
      { "<leader><F5>", "<cmd>lua require('dap').continue()<cr>", desc = "Debug Start/continue" },
      { "<leader><F10>", "<cmd>lua require('dap').step_over()<cr>", desc = "Debug Step Over" },
      { "<leader><F11>", "<cmd>lua require('dap').step_into()<cr>", desc = "Debug Step Into" },
      { "<leader><F12>", "<cmd>lua require('dap').step_out()<cr>", desc = "Debug Step Out" },
      { "<leader>d", group = "Debug" },
      {
        "<leader>db",
        "<cmd>lua require('dap').toggle_breakpoint()<cr>",
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dl",
        "<cmd>lua require('dap').run_last()<cr>",
        desc = "Run Last",
      },
      { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "UI" },
      {
        "<leader>dR",
        "<cmd>lua require('dap').repl.toggle()<cr>",
        desc = "Toggle Repl",
      },
      { "<leader>dx", "<cmd>lua require('dap').terminate()<cr>", desc = "Exit" },

      --[[ PACKAGES OPs ]]
      { "<leader>p", group = "Packages Manager" },
      { "<leader>po", "<cmd>Lazy<cr>", desc = "Open Lazy Screen" },
      { "<leader>pu", "<cmd>Lazy <cr>", desc = "Open Lazy Screen" },
      { "<leader>ph", "<cmd>Lazy health<cr>", desc = "Health" },
      { "<leader>pm", "<cmd>Mason<cr>", desc = "Open Mason" },
    },
  },
  config = function(_, opts)
    local whichkey = require("which-key")
    whichkey.setup(opts)
  end,
}
