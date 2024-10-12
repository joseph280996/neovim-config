return {
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  lazy = true,
  opts = {
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
  },
}
