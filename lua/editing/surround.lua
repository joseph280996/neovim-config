-- Surround with quotes, brackets, and parenthesis
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      normal = "s",
      normal_cur = "ss",
      normal_line = "S",
      normal_cur_line = "SS",
    })
  end,
}
