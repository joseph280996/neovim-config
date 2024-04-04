return {
  -- Development Utilities
  "numToStr/Comment.nvim", -- Easily comment stuff
  lazy = false,
  opts = {
    mappings = false,
  },
  dependencies = {
    "folke/which-key.nvim",
  },
  config = function(_, opts)
    require("Comment").setup(opts)
    local comment_api = require("Comment.api")
    local wk = require("which-key")

    local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

    local toggle_bwcomment_selection = function()
      vim.api.nvim_feedkeys(esc, "nx", false)
      comment_api.toggle.blockwise(vim.fn.visualmode())
    end

    local toggle_lwcomment_selection = function()
      vim.api.nvim_feedkeys(esc, "nx", false)
      comment_api.toggle.linewise(vim.fn.visualmode())
    end

    local visual_keymap_opts = {
      mode = "v", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    wk.register({
      l = {
        name = "LSP",
        c = {
          name = "Comment",
          b = {
            toggle_bwcomment_selection,
            "Blockwise Toggle",
          },
          l = {
            toggle_lwcomment_selection,
            "Linewise Toggle",
          },
        },
      },
    }, visual_keymap_opts)
  end,
}
