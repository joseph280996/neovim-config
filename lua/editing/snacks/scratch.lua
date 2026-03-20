local constants = require("utils.constants")

local KEYBINDING_OPTS = constants.KEYBINDING_OPTS

return {
  config = {
    enabled = true,
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>ns",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>nS",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    }, KEYBINDING_OPTS),
  },
}
