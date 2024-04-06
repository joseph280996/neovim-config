-- Markdown
return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
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
