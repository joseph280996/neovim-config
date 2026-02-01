local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  {
    "Davidyz/VectorCode",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- enabled = false,
  },
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = function()
      return {
        memory = {
          opts = {
            chat = {
              enabled = true,
              condition = function(chat)
                return chat.adapter.type ~= "acp"
              end,
            },
          },
        },
        interactions = {
          -- Change the default chat adapter
          chat = {
            adapter = {
              name = "copilot",
              model = "claude-opus-4.5",
            },
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
            keymaps = {
              close = {
                modes = { n = "<C-x>", i = "<C-x>" },
                opts = {},
              },
            },
          },
          inline = {
            adapter = "copilot",
          },
        },
        extensions = {
          vectorcode = {
            opts = {
              tool_group = {
                enabled = true,
              },
            },
          },
          history = {
            enabled = true,
            opts = {
              keymap = "gh",
              save_chat_keymap = "sc",
              auto_save = true,
              expiration_days = 0,
              picker = "snacks",
            },
          },
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
      }
    end,
    keys = {
      -- Normal
      vim.tbl_deep_extend("force", {
        "<leader><leader>ci",
        function()
          local input = vim.fn.input("CodeCompanion: ")
          if input ~= "" then
            vim.cmd("CodeCompanion" .. input)
          end
        end,
        desc = "Inline Assistant",
      }, KEYBINDING_OPTS),
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
      -- Visual
      vim.tbl_deep_extend("force", {
        mode = "x",
        "<leader>c",
        function()
          local input = vim.fn.input("CodeCompanion: ")
          if input ~= "" then
            local start_line = vim.fn.line("'<")
            local end_line = vim.fn.line("'>")
            vim.cmd(string.format("%d,%dCodeCompanion %s", start_line, end_line, input))
          end
        end,
        desc = "Inline Assistant",
      }, KEYBINDING_OPTS),
    },
  },
}
