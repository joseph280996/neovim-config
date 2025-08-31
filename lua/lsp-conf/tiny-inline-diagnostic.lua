return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    preset = "minimal",
    transparent_cursorline = false,
    options = {
      multilines = {
        enabled = true,
      },
    },
  },
}
