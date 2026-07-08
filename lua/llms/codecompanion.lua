local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  {
    "Davidyz/VectorCode",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
      "cairijun/codecompanion-agentskills.nvim",
    },
    opts = {
      prompt_library = {
        markdown = {
          dirs = {
            "~/Code/Work/utils/prompts/",
          },
        },
      },
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
        background = {
          chat = {
            callbacks = {
              ["on_ready"] = {
                actions = {
                  "interactions.background.builtin.chat_make_title",
                },
                enabled = false,
              },
            },
            opts = {
              enabled = true,
            },
          },
        },
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
          keymaps = {
            close = {
              modes = { n = "<C-x>", i = "<C-x>" },
              opts = {},
            },
          },
          opts = {
            completion_provider = "blink",
          },
        },
      },
      extensions = {
        vectorcode = {
          opts = {
            tool_goup = {
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
            -- Title generation needs an HTTP adapter; the chat uses the
            -- claude_code ACP adapter (Bedrock) which can't generate titles.
            auto_generate_title = false,
            expiration_days = 0,
            picker = "snacks",
          },
        },
        agentskills = {
          opts = {
            paths = {
              { "~/Code/utils/skills/", recursive = true },
            },
          },
        },
      },
      adapters = {
        acp = {
          claude_code = function()
            return require("codecompanion.adapters").extend("claude_code", {
              defaults = {
                mcpServers = "inherit_from_config",
              },
            })
          end,
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
      vim.tbl_deep_extend("force", {
        "<leader>c",
        function()
          local input = vim.fn.input("CodeCompanion: ")
          if input ~= "" then
            vim.cmd("CodeCompanion <,>" .. input)
          end
        end,
        desc = "CodeCompanion Inline Assistant",
      }, KEYBINDING_OPTS),
    },
  },
}
