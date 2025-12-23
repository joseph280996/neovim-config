return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      "disrupted/blink-cmp-conventional-commits",
      "erooke/blink-cmp-latex",
      "fang2hou/blink-copilot"
    },

    -- use a release tag to download pre-built binaries
    version = "*",
    opts = {
      completion = {
        keyword = { range = "full" },

        -- Disable auto brackets
        -- NOTE: some LSPs may add auto brackets themselves anyway
        accept = { auto_brackets = { enabled = true } },

        -- Insert completion item on selection, don't select by default
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
          cycle = {
            from_top = true,
          },
        },
        menu = {
          -- Don't automatically show the completion menu
          auto_show = true,

          -- nvim-cmp style menu
          draw = {
            columns = {
              { "label", "label_description", gap = 2 },
              { "kind_icon", "kind" },
            },
          },
        },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
      sources = {
        -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
        default = { "copilot", "lsp", "path", "snippets" },
        -- Disable cmdline completions
        per_filetype = {
          tex = { inherit_defaults = true, "latex" },
          cs = { inherit_defaults = true, "buffer", "easy-dotnet" },
          gitcommit = { inherit_defaults = true, "conventional_commits" },
        },
        providers = {
          conventional_commits = {
            name = "Conventional Commits",
            module = "blink-cmp-conventional-commits",
            enabled = true,
          },
          ["easy-dotnet"] = {
            name = "easy-dotnet",
            enabled = true,
            module = "easy-dotnet.completion.blink",
            score_offset = 10000,
            async = true,
          },
          latex = {
            name = "Latex",
            module = "blink-cmp-latex",
            opts = {
              -- set to true to insert the latex command instead of the symbol
              insert_command = false,
            },
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true
          }
        },
      },

      -- Experimental signature help support
      signature = { enabled = true },

      keymap = {
        preset = "super-tab",
      },
    },
    opts_extend = { "sources.default" },
  },
}
