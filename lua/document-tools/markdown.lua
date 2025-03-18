local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

-- Markdown
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown", "Avante" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      vim.tbl_deep_extend("force", {
        "<leader>um",
        "<cmd>MarkdownPreview<cr>",
        desc = "Preview Markdown",
      }, KEYBINDING_OPTS),
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    enabled = true,
    dependencies = {
      -- You may not need this if you don't lazy load
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      preview = {
        buf_ignore = {},
        max_buf_length = 1000,
        filetypes = { "markdown", "Avante" },
        hybrid_modes = { "n" },
      },
      markdown = {
        code_blocks = {
          enable = true,
          style = "block",
          min_width = 60,
          pad_amount = 3,
          language_names = {
            { "py", "python" },
            { "cpp", "C++" },
            { "js", "javascript" },
            { "ts", "typescript" },
          },
          label_direction = "left",
        },
        headings = {
          enable = true,
        },
      },
    },
  },
}
