vim.api.nvim_create_autocmd({ "VimEnter", "BufRead", "BufNew" }, {
  pattern = { "*.ixx", "*.cppm", "*.ccm" },
  command = "setfiletype cpp",
})
