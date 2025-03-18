local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    })
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>gj",
      "<cmd>lua require('gitsigns').next_hunk()<cr>",
      desc = "Next Hunk",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gk",
      "<cmd>lua require('gitsigns').prev_hunk()<cr>",
      desc = "Prev Hunk",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gp",
      "<cmd>lua require('gitsigns').preview_hunk()<cr>",
      desc = "Preview Hunk",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gr",
      "<cmd>lua require('gitsigns').reset_hunk()<cr>",
      desc = "Reset Hunk",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gs",
      "<cmd>lua require('gitsigns').stage_hunk()<cr>",
      desc = "Stage Hunk",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gu",
      "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>",
      desc = "Undo Stage Hunk",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gS",
      "<cmd>lua require('gitsigns').stage_buffer()<cr>",
      desc = "Stage Buffer",
    }, KEYBINDING_OPTS  ),
    vim.tbl_deep_extend("force", {
      "<leader>gR",
      "<cmd>lua require('gitsigns').reset_buffer()<cr>",
      desc = "Reset Buffer",
    }, KEYBINDING_OPTS  ),
  },
}
