vim.api.nvim_create_autocmd({ "VimEnter", "BufRead", "BufNew" }, {
  pattern = "*.ipynb",
  command = "setfiletype ipynb",
})
