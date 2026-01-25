local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>gdm",
      "<cmd>CodeDiff master<cr>",
      desc = "Against master",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>gdfm",
      "<cmd>CodeDiff file main<cr>",
      desc = "Against master",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>gdfh",
      "<cmd>CodeDiff file HEAD<cr>",
      desc = "Against last commit",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>gh",
      "<cmd>CodeDiff history<cr>",
      desc = "Git History",
    }, KEYBINDING_OPTS),
  },
}
