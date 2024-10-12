return {
  "folke/todo-comments.nvim", -- Highlight todo comments
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  opts = true,
}
