local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require("treesj").setup({ use_default_keymaps = false })
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<space>ej",
      "<cmd>TSJToggle<cr>",
      desc = "Toggle code join",
    }, KEYBINDING_OPTS  ),
  },
}
