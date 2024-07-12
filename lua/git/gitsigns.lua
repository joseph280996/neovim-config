return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "folke/which-key.nvim" },
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

    local wk = require("which-key")
    wk.register({
      j = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>GitBlameToggle<cr>", "Blame" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
      s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      S = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "Stage Buffer" },
      R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
    }, {
      prefix = "<leader>g",
    })
  end,
}
