local get_values_on_os = require("user.utils.get-values-on-os")

-- Magma
return {
  "dccsillag/magma-nvim",
  lazy = false,
  ft = { "ipynb" },
  run = ":UpdateRemotePlugins",
  dependencies = { "folke/which-key.nvim" },
  config = function()
    vim.g.magma_image_provider = get_values_on_os({ Window = "none", Linux = "ueberzug" })
    vim.g.magma_automatically_open_output = true

    local wk = require("which-key")

    wk.register({
      m = {
        name = "Magma",
        i = {
          name = "Init",
          p = { "<cmd>MagmaInit<cr>", "Initialize Python" },
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
