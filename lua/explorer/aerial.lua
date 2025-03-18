local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  {
    "stevearc/aerial.nvim",
    lazy = false,
    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
      show_guides = true,
      layout = {
        default_direction = "prefer_right",
      },
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
        "Array",
        "Boolean",
        "Enum",
        "Field",
        "Variable",
        "Object",
        "Number",
        "Property",
        "EnumMember",
        "String",
        "TypeParameter",
      },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "kyazdani42/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    config = function(_, opts)
      require("aerial").setup(opts)
    end,
    keys = {
      vim.tbl_deep_extend("force", {
        "<leader>xo",
        "<cmd>AerialToggle!<cr>",
        desc = "Outline",
      }, KEYBINDING_OPTS  ),
      vim.tbl_deep_extend("force", {
        "<leader>fs",
        function()
          require("aerial").snacks_picker({ layout = { preset = "vscode", preview = false } })
        end,
        desc = "LSP Symbols",
      }, KEYBINDING_OPTS  ),
      vim.tbl_deep_extend("force", {
        "]s",
        "<cmd>AerialNext<cr>",
        desc = "Next Symbols",
      }, KEYBINDING_OPTS  ),
      vim.tbl_deep_extend("force", {
        "]s",
        "<cmd>AerialPrev<cr>",
        desc = "Previous Symbols",
      }, KEYBINDING_OPTS  ),
    },
  },
}
