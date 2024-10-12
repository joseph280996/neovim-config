-- lazy.nvim
return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    diabled_filetypes = { "qf", "lazy", "mason", "alpha", "dashboard" },
  },
}
