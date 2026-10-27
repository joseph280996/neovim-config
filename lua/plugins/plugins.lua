local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  {
    "ChmaraX/herdr-nvim",
    opts = { keymaps = false },
    keys = {
      vim.tbl_deep_extend("force", {
        "<leader>ahc",
        "<CMD>Herdr comment<CR>",
        desc = "Herdr comment",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>ahs",
        "<CMD>Herdr send<CR>",
        desc = "Herdr send",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>ahS",
        "<CMD>Herdr submit<CR>",
        desc = "Herdr submit",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>ahc",
        function()
          require("herdr-nvim").comment_selection()
        end,
        mode = { "x" },
        desc = "Herdr comment",
      }, KEYBINDING_OPTS),
    },
  },
}
