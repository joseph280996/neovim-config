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
    {
      "<leader>gg",
      "<cmd>Neogit<cr>",
      desc = "Open Git UI",
      mode = "n",
      silent = true,
      noremap = true,
      nowait = true,
    },
  },
}
