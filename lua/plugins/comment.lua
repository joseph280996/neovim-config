local toggle_bwcomment_selection = function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.blockwise(vim.fn.visualmode())
end

local toggle_lwcomment_selection = function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end

return {
  -- Development Utilities
  "numToStr/Comment.nvim", -- Easily comment stuff
  lazy = true,
  opts = {
    mappings = false,
  },
  keys = {
    {
      "<leader>cc",
      "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
      mode = "n",
      desc = "Linewise Toggle Commenting",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>cb",
      toggle_bwcomment_selection,
      mode = "v",
      desc = "Blockwise Toggle",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>cl",
      toggle_lwcomment_selection,
      mode = "v",
      desc = "Linewise Toggle",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
