-- lazy.nvim
return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    diabled_filetypes = { "neo-tree", "qf", "netrw", "lazy", "mason", "alpha", "dashboard" },
  },
}
