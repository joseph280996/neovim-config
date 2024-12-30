return {
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  lazy = true,
  opts = {
    hint = "floating-big-letter",
    filter_func = function(windows, rules)
      local dfilter = require("window-picker.filters.default-window-filter"):new()
      dfilter:set_config(rules)
      local original_filtered = dfilter:filter_windows(windows)

      return vim.tbl_filter(function(wid)
        local window = vim.api.nvim_win_get_config(wid)
        return window.focusable
      end, original_filtered)
    end,
    filter_rules = {
      include_current_win = true,
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
