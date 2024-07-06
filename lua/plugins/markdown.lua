-- Markdown
return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = { "markdown" },
  keys = {
    {
      "<leader>um",
      "<cmd>MarkdownPreview<cr>",
      desc = "Preview Markdown",
      mode = "n",
      silent = true,
      noremap = true,
      nowait = true,
    },
  },
}
