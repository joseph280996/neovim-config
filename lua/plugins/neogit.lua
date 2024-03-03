return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
  },
  opts = {
    integrations = {
      telescope = true,
      diffview = true,
    },
  },
  config = function(_, opts)
    local neogit = require("neogit")
    neogit.setup(opts)
    local wk = require("which-key")

    wk.register({
      g = { "<cmd>Neogit<cr>", "Open Git UI" },
    }, {
      prefix = "<leader>g",
    })
  end,
}
