local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  "MagicDuck/grug-far.nvim",
  opts = true,
  cond = not vim.g.vscode,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>fr",
      "<cmd>GrugFar<cr>",
      desc = "Find and Replace",
    }, KEYBINDING_OPTS),
  },
}
