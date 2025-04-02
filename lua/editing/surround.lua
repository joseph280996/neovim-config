-- Surround with quotes, brackets, and parenthesis
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      visual = "gs",
    })
  end,
}
