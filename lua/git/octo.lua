return {
  "pwntester/octo.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    default_merge_method = "rebase", -- default merge method which should be used for both `Octo pr merge` and merging from picker, could be `commit`, `rebase` or `squash`
    picker = "snacks", -- or "fzf-lua"
  },
  cmd = "Octo",
}
