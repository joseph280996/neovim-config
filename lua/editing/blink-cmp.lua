return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
  },
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      "micangl/cmp-vimtex",
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
              { "label",     "label_description", gap = 2 },
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
        implementation = "prefer_rust_with_warning"
      },
      sources = {
        -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
        default = { "lsp", "path", "snippets", "buffer" },
        -- Disable cmdline completions
        per_filetype = {
          tex = { inherit_defaults = true, "vimtex", "dictionary" },
          cs = { inherit_defaults = true, "easy-dotnet" },
        },
        providers = {
          ["easy-dotnet"] = {
            name = "easy-dotnet",
            enabled = true,
            module = "easy-dotnet.completion.blink",
            score_offset = 10000,
            async = true,
          },
          vimtex = {
            name = "vimtex",
            module = "blink.compat.source",
          },
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
