return {
  "igorlfs/nvim-dap-view",
  opts = true,
  keys = {
    {
      "<leader>du",
      "<cmd>DapViewToggle<cr>",
      desc = "UI",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
