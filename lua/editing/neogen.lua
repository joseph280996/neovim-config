return {
  "danymat/neogen",
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  keys = {
    {
      "<leader>cdg",
      "<cmd>Neogen<cr>",
      mode = "n",
      desc = "Auto Generate function|class|type doc",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>cdf",
      "<cmd>Neogen function<cr>",
      mode = "n",
      desc = "Generate function doc",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>cdc",
      "<cmd>Neogen class<cr>",
      mode = "n",
      desc = "Generate class doc",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>cdt",
      "<cmd>Neogen type<cr>",
      mode = "n",
      desc = "Generate type doc",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
