return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      mappings = {},
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing = "linear", -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
    })
  end,
  keys = {
    {
      "<C-u>",
      "<cmd>lua require('neoscroll').ctrl_u({duration = 500, easing='sine'})<cr>",
      mode = "n",
    },
    {
      "<C-u>",
      "<cmd>lua require('neoscroll').ctrl_u({duration = 500, easing='sine'})<cr>",
      mode = "v",
    },
    {
      "<C-d>",
      "<cmd>lua require('neoscroll').ctrl_d({duration = 500, easing='sine'})<cr>",
      mode = "n",
    },
    {
      "<C-d>",
      "<cmd>lua require('neoscroll').ctrl_d({duration = 500, easing='sine'})<cr>",
      mode = "v",
    },
    {
      "<C-b>",
      "<cmd>lua require('neoscroll').ctrl_b({duration = 1000, easing='sine'})<cr>",
      mode = "n",
    },
    {
      "<C-b>",
      "<cmd>lua require('neoscroll').ctrl_b({duration = 1000, easing='sine'})<cr>",
      mode = "v",
    },
    {
      "<C-f>",
      "<cmd>lua require('neoscroll').ctrl_f({duration = 1000, easing='sine'})<cr>",
      mode = "n",
    },
    {
      "<C-f>",
      "<cmd>lua require('neoscroll').ctrl_f({duration = 1000, easing='sine'})<cr>",
      mode = "v",
    },
    {
      "<C-y>",
      "<cmd>lua require('neoscroll').scroll(-0.1, {move_cursor = false; duration = 100})<cr>",
      mode = "n",
    },
    {
      "<C-y>",
      "<cmd>lua require('neoscroll').scroll(-0.1, {move_cursor = false; duration = 100})<cr>",
      mode = "v",
    },
    {
      "<C-e>",
      "<cmd>lua require('neoscroll').scroll(0.1, {move_cursor = false; duration = 100})<cr>",
      mode = "n",
    },
    {
      "<C-e>",
      "<cmd>lua require('neoscroll').scroll(0.1, {move_cursor = false; duration = 100})<cr>",
      mode = "v",
    },
  },
}
