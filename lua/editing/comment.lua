return {
  -- Development Utilities
  "numToStr/Comment.nvim", -- Easily comment stuff
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = {
    toggler = {
      ---Line-comment toggle keymap
      line = "gcc",
      ---Block-comment toggle keymap
      block = "gbc",
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Line-comment keymap
      line = "gc",
      ---Block-comment keymap
      block = "gb",
    },
    ---LHS of extra mappings
    extra = {
      ---Add comment on the line above
      above = "gcO",
      ---Add comment on the line below
      below = "gco",
      ---Add comment at the end of line
      eol = "gcA",
    },
  },
  config = function(_, opts)
    opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    require("Comment").setup(opts)
  end,
}
