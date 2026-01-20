local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

-- Markdown
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
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
    dependencies = {
      -- You may not need this if you don't lazy load
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "rebelot/kanagawa.nvim",
    },
    config = function(_, opts)
      local presets = require("markview.presets")
      opts.markdown.headings = presets.headings.slanted
      opts.markdown.horizontal_rules = presets.horizontal_rules.thin
      opts.markdown.tables = presets.tables.rounded
      require("markview").setup(opts)
    end,
    opts = {
      preview = {
        buf_ignore = {},
        max_buf_length = 1000,
        hybrid_modes = { "n" },
        filetypes = {
          "md",
          "markdown",
          "norg",
          "rmd",
          "org",
          "vimwiki",
          "typst",
          "latex",
          "quarto",
          "codecompanion",
        },
        ignore_buftypes = {},

        condition = function(buffer)
          local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt

          if bt == "nofile" and ft == "codecompanion" then
            return true
          elseif bt == "nofile" then
            return false
          else
            return true
          end
        end,
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
      latex = {
        enable = false,
      },
      latex_static = {
        enable = false,
      },
      html = {
        enable = false,
      },
      yaml = {
        enable = false,
      },
      typst = {
        enable = false,
      },
    },
  },
}
