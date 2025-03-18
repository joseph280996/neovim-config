local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "danymat/neogen",
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>cdg",
      "<cmd>Neogen<cr>",
      desc = "Auto Generate function|class|type doc",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>cdf",
      "<cmd>Neogen function<cr>",
      desc = "Generate function doc",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>cdc",
      "<cmd>Neogen class<cr>",
      desc = "Generate class doc",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>cdt",
      "<cmd>Neogen type<cr>",
      desc = "Generate type doc",
    }, KEYBINDING_OPTS),
  },
}
