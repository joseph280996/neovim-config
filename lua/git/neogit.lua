local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  "NeogitOrg/neogit",
  commit = "f6664d4bc73bec65c0ec0df49f1873061dff08b0",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "folke/snacks.nvim", -- optional
  },
  opts = {
    kind = "auto",
    integrations = {
      snacks = true,
      codediff = true
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
