-- lazy.nvim
return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    diabled_filetypes = { "qf", "lazy", "mason", "alpha", "dashboard" },
  },
  keys = {
    {
      "<leader>hh",
      "<cmd>Hardtime toggle",
      desc = "Toggle Hardtime",
      silent = true,
      noremap = true,
      nowait = true,
    },
  },
}
