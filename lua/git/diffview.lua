local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  "sindrets/diffview.nvim",
  opts = {
    view = {
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = "diff3_mixed",
      },
    },
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>gd",
      "<cmd>DiffviewOpen<cr>",
      desc = "Git Diffview",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gh",
      "<cmd>DiffviewFileHistory<cr>",
      desc = "Git Diffview",
    }, KEYBINDING_OPTS  ),
  },
}
