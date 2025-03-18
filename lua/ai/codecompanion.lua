local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "anthropic",
        slash_commands = {
          ["file"] = {
            opts = {
              provider = "snacks",
            },
          },
          [""] = {
            opts = {
              provider = "snacks",
            },
          },
        },
      },
      inline = {
        adapter = "anthropic",
      },
      keymaps = {
        close = {
          modes = {
            n = "<C-x>",
            i = "<C-x>",
          },
        },
      },
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader><leader>cc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      mode = "n",
      desc = "Toggle Chat Buffer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader><leader>cp",
      "<cmd>CodeCompanionActions<cr>",
      mode = "n",
      desc = "Open Command Palettes",
    }, KEYBINDING_OPTS),
  },
}
