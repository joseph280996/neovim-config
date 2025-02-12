return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require("treesj").setup({ use_default_keymaps = false })
  end,
  keys = {
    {
      "<space>cj",
      "<cmd>TSJToggle<cr>",
      desc = "Toggle TreeSitter join",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
  },
}
