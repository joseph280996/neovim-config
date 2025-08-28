local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "snacks_picker",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },
      },
    })
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>zn",
      "<cmd>ZkNew { title = vim.fn.input('Title: ')}<cr>",
      desc = "Create new file with name",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>zo",
      "<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
      desc = "Open Notes picker",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>zt",
      "<cmd>ZkTags<cr>",
      desc = "Open Notes picker associated with selected tags",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>zf",
      "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
      desc = "Search for notes matching a given query",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>zf",
      ":'<,'>ZkMatch<CR>",
      desc = "Search for notes matching a given query",
      mode = "x",
    }, KEYBINDING_OPTS),
  },
}
