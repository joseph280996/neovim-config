return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snacks_picker",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
          capabilties = require("lsp.config.capabilities"),
        },
      },
    })
  end,
  keys = {
    {
      "<leader>zn",
      "<cmd>ZkNew { title = vim.fn.input('Title: ')}<cr>",
      desc = "Create new file with name",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
    {
      "<leader>zo",
      "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
      desc = "Open Notes picker",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
    {
      "<leader>zt",
      "<cmd>ZkTags<cr>",
      desc = "Open Notes picker associated with selected tags",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
    {
      "<leader>zf",
      "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
      desc = "Search for notes matching a given query",
      mode = "n",
      noremap = true,
      nowait = true,
      silent = true,
    },
    {
      "<leader>zf",
      ":'<,'>ZkMatch<CR>",
      desc = "Search for notes matching a given query",
      mode = "x",
      noremap = true,
      nowait = true,
      silent = true,
    },

  },
}
