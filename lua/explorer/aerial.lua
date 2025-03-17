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
      {
        "<leader>xo",
        "<cmd>AerialToggle!<cr>",
        desc = "Outline",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>fs",
        function()
          require("aerial").snacks_picker({ layout = { preset = "vscode", preview = false } })
        end,
        desc = "LSP Symbols",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "]s",
        "<cmd>AerialNext<cr>",
        desc = "Next Symbols",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "]s",
        "<cmd>AerialPrev<cr>",
        desc = "Previous Symbols",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
