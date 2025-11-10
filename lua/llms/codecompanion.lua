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
        adapter = "claude_code",
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
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              CLAUDE_CODE_OAUTH_KEY = vim.env.CLAUDE_CODE_OAUTH_TOKEN
            }
          })
        end
      }
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_tools = true,
          show_server_tools_in_chat = true,
          add_mcp_prefix_to_tool_names = false,
          show_result_in_chat = true,
          format_tool = nil,
          make_vars = true,
          make_slash_commands = true,
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
      desc = "Toggle Chat Buffer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader><leader>cp",
      "<cmd>CodeCompanionActions<cr>",
      desc = "Open Command Palettes",
    }, KEYBINDING_OPTS),
  },
}
