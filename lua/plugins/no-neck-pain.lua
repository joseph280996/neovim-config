return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  ft = "tex",
  config = true,
  keys = {
    {
      "<leader>bc",
      "<cmd>NoNeckPain<cr>",
      desc = "Focus Center",
      mode = "n",
      silent = true,
      noremap = true,
      nowait = true,
    },
  },
}
