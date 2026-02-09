local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    width = 120,
    integrations = {
      -- @link https://github.com/nvim-neo-tree/neo-tree.nvim
      NeoTree = {
        -- The position of the tree.
        ---@type "left"|"right"
        position = "left",
        -- When `true`, if the tree was opened before enabling the plugin, we will reopen it.
        reopen = true,
      },
      aerial = {
        -- The position of the tree.
        ---@type "left"|"right"
        position = "right",
        -- When `true`, if the tree was opened before enabling the plugin, we will reopen it.
        reopen = true,
      },
      neotest = {
        -- The position of the tree.
        ---@type "right"
        position = "right",
        -- When `true`, if the tree was opened before enabling the plugin, we will reopen it.
        reopen = true,
      },
    },
  },
  config = function(_, opts)
    local document_fts = { "tex", "markdown" }

    if vim.tbl_contains(document_fts, vim.bo.filetype) then
      opts.width = 200
    end
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>ec",
      "<cmd>NoNeckPain<cr>",
      desc = "Focus Center",
    }, KEYBINDING_OPTS),
  },
}
