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
      { "<leader>ff", group = "Find Files" },
      { "<leader>g", group = "Git" },

      { "<leader>h", group = "Hardtime" },

      --[[ LSP OPs ]]
      { "<leader>l", group = "LSP" },
      { "<leader>lf", group = "Fix" },
      { "<leader>lt", group = "Trouble" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>c", group = "Comment" },
      { "<leader>cd", group = "Code Document Comment" },
      { "<leader>c", group = "Comment", mode = "v" },

      { "<leader>u", group = "Utilities" },
      { "<leader>uk", group = "Kulala" },

      { "<leader>x", group = "Explorer" },
      { "<leader>m", group = "Molten" },
      {
        "<leader>mn",
        "<cmd>NewJupyterNotebook main<cr>",
        desc = "Initialize an empty JupyterNotebook",
      },
      { "<leader>mc", group = "Molten Cell Navigation" },
      { "<leader>me", group = "Molten Evaluate" },
      { "<leader>m", group = "Molten", mode = "v" },
      { "<leader>n", group = "Notes" },
      { "<leader>v", group = "Vim Packages" },
      { "<leader>vt", group = "VimTex" },
      { "<leader>s", group = "Surround" },

      --[[ UNIT TESTING ]]
      { "<leader>T", group = "Unit Testing" },
      { "<leader>TR ", group = "Run" },
      { "<leader>TW ", group = "Watch" },

      --[[ DAP OPs ]]
      { "<leader>d", group = "Debug" },

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
