local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
  },
  opts = {
    kind = "auto",
    integrations = {
      telescope = true,
      diffview = true,
    },
    commit_editor = {
      kind = "auto"
    }
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>gg",
      "<cmd>Neogit<cr>",
      desc = "Open Git UI",
    }, KEYBINDING_OPTS  ),
  },
}
