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
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { "markdown" },
      completions = { lsp = { enabled = true } },
      heading = {
        width = "block",
        left_pad = 1,
        right_pad = 1,
      },
      code = {
        width = "block",
        min_width = 60,
        left_pad = 3,
        right_pad = 3,
        position = "left",
      },
      pipe_table = { preset = "round" },
      latex = { enabled = false },
      html = { enabled = false },
      yaml = { enabled = false },
    },
    keys = {
      vim.tbl_deep_extend("force", {
        "<leader>uM",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Toggle Markdown Render",
      }, KEYBINDING_OPTS),
    },
  },
}
