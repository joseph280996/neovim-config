return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  version = "2.*",
  event = "VeryLazy",
  config = function()
    require("window-picker").setup({
      hint = "statusline-winbar",
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify" },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal", "quickfix" },
        },
      },
    })
  end,
}
