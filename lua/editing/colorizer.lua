return {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  opts = {
    "*",
    "!vim",
  },
}
