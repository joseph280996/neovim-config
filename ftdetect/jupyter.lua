vim.api.nvim_create_autocmd({'BufRead', 'BufNew'}, {
  pattern = '*.ipynb',
  command = 'setfiletype ipynb'
})
