local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

-- Markdown
return {
  {
    "blackhat-7/vellum.nvim",
    cmd = { "Vellum" },
    ft = { "markdown" },
    opts = {},
    keys = {
      vim.tbl_deep_extend("force", {
        "<leader>ump",
        "<cmd>Vellum<cr>",
        desc = "Toggle Markdown Preview",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>umz",
        function()
          require("vellum").zoom()
        end,
        desc = "Zoom Markdown Image/Diagram",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>ume",
        "<cmd>Vellum export<cr>",
        desc = "Export Markdown to PDF",
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
