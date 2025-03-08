-- Surround with quotes, brackets, and parenthesis
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = true,
  keys = {
    {
      "<C-g>s",
      "<Plug>(nvim-surround-insert)",
      desc = "Surround normal",
      mode = "i",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<C-g>S",
      "<Plug>(nvim-surround-insert-line)",
      mode = "i",
      desc = "Surround normal",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "s",
      "<Plug>(nvim-surround-normal)",
      desc = "Surround normal",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "S",
      "<Plug>(nvim-surround-normal-curr)",
      desc = "Surround normal current line",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "yS",
      "<Plug>(nvim-surround-normal-line)",
      desc = "Surround normal delimiter on new line",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "ySS",
      "<Plug>(nvim-surround-normal-curr-line)",
      desc = "Surround normal whole line delimiter on new line",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "S",
      "<Plug>(nvim-surround-visual)",
      desc = "Surround visual",
      mode = "x",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "gS",
      "<Plug>(nvim-surround-visual-line)",
      desc = "Surround visual line",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "ds",
      "<Plug>(nvim-surround-delete)",
      desc = "Delete surrounding",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "cS",
      "<Plug>(nvim-surround-change-line)",
      desc = "Change surrounding",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
