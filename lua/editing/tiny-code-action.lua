local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "folke/snacks.nvim" },
  },
  event = "LspAttach",
  opts = {},
  keys = {
    vim.tbl_deep_extend("force", {
      "gra",
      function()
        require("tiny-code-action").code_action()
      end
      desc = "Open code action list",
    }, KEYBINDING_OPTS),
  },
}
