return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "neovim/nvim-lspconfig", -- Native LSP
  },
  lazy = false,
  opts = {
    close_fold_kinds_for_ft = {
      cs = {
        "imports",
        "region",
      },
      default = { "imports" },
    },
  },
  config = function(_, opts)
    require("ufo").setup(opts)
  end,
  keys = {
    {
      "zr",
      "<cmd>lua require('ufo').openFoldsExceptKinds()<cr>",
      mode = "n",
      desc = "Open Folds Except Kinds",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "zm",
      "<cmd>lua require('ufo').closeFoldsWith()<cr>",
      mode = "n",
      desc = "Close Folds With",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "zR",
      "<cmd>lua require('ufo').openAllFolds()<cr>",
      mode = "n",
      desc = "Open All Folds",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "K",
      function()
        local winId = require("ufo").peekFoldedLinesUnderCursor()
        if not winId then
          vim.lsp.buf.hover()
        end
      end,
      mode = "n",
      desc = "Toggle Lsp Hover",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "zM",
      "<cmd>lua require('ufo').closeAllFolds()<cr>",
      mode = "n",
      desc = "Close All Folds",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
