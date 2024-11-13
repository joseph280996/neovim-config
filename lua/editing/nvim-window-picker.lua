return {
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  lazy = true,
  opts = {
    hint = "floating-big-letter",
    filter_func = function(windows, rules)
      local function predicate(wid)
        cfg = vim.api.nvim_win_get_config(wid)
        if not cfg.focusable then
          return false
        end
        return true
      end
      local filtered = vim.tbl_filter(predicate, windows)

      local dfilter = require("window-picker.filters.default-window-filter"):new()
      dfilter:set_config(rules)
      return dfilter:filter_windows(filtered)
    end,
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
