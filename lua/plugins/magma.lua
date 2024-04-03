-- Magma
return {
  "dccsillag/magma-nvim",
  lazy = false,
  keys = ":UpdateRemotePlugins",
  dependencies = { "folke/which-key.nvim" },
  config = function()
    vim.g.magma_image_provider = "none"
    vim.g.magma_automatically_open_output = true

    local wk = require("which-key")

    wk.register({
      m = {
        name = "Magma",
        i = {
          name = "Init",
          p = { "<cmd>MagmaInitPython<cr>", "Initialize Python" },
        },
        r = { "<cmd>MagmaEvaluateOperator<cr>", "Evaluate Operator" },
        l = { "<cmd>MagmaEvaluateLine<cr>", "Evaluate Whole Line" },
        c = { "<cmd>MagmaReevaluateCell<cr>", "Reevaluate Current Cell" },
        d = { "<cmd>MagmaDelete<cr>", "Delete Output" },
        o = { "<cmd>MagmaShowOutput<cr>", "Show Output" },
      },
    }, {
      prefix = "<leader>l",
      mode = "n",
    })
    wk.register({
      m = {
        name = "Magma",
        r = { "<cmd>MagmaEvaluateVisual<cr>", "Evaluate Selection" },
      },
    }, {
      prefix = "<leader>l",
      mode = "v",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    })
  end,
}
