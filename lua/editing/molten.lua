-- Magma
return {
  "benlubas/molten-nvim",
  ft = "ipynb",
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  dependencies = "willothy/wezterm.nvim",
  init = function()
    vim.g.molten_image_provider = "wezterm"
    vim.g.molten_auto_open_output = false
    vim.g.molten_auto_image_popup = true
    vim.g.molten_split_direction = "bottom"
    vim.g.molten_split_size = 20
  end,
  keys = {
    {
      "<leader>mi",
      "<cmd>MoltenInit<cr>",
      desc = "Initialize Python",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>meo",
      "<cmd>MoltenEvaluateOperator<cr>",
      desc = "Evaluate Operator",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>mel",
      "<cmd>MoltenEvaluateLine<cr>",
      desc = "Evaluate Whole Line",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>mec",
      "<cmd>MoltenReevaluateCell<cr>",
      desc = "Reevaluate Current Cell",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>md",
      "<cmd>MoltenDelete<cr>",
      desc = "Delete Active Cell",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>mo",
      "<cmd>MoltenEnterOutput<cr>",
      desc = "Show Output",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ms",
      "<cmd>MoltenSave<cr>",
      desc = "Save Cell Output",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ml",
      "<cmd>MoltenLoad<cr>",
      desc = "Load Cell Output",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>me",
      "<cmd>MoltenEvaluateVisual<cr>",
      desc = "Evaluate Selection",
      mode = "v",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>mcn",
      "<cmd>MoltenNext<cr>",
      desc = "Go to next cell",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>mcp",
      "<cmd>MoltenPrev<cr>",
      desc = "Go to previous cell",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
