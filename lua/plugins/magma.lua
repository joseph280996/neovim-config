function MagmaInitPython()
  vim.cmd([[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]])
end

return {
  "dccsillag/magma-nvim",
  build = ":UpdateRemotePlugins",
  dependencies = { "folke/which-key.nvim" },
  config = function()
    local wk = require("which-key")

    wk.register({
      m = {
        name = "Magma",
        i = {
          name = "Init",
          p = { MagmaInitPython, "Initialize Python" },
        },
        e = { "<cmd>MagmaEvaluateOperator<cr>", "Evaluate operator" },
        el = { "<cmd>MagmaEvaluateLine<cr>", "Evaluate the current line" },
        ec = { "<cmd>MagmaReevaluateCell<cr>", "Reevaluate current cell" },
        ed = { "<cmd>MagmaDelete<cr>", "Delete current cell" },
        eo = { "<cmd>MagmaShowOutput<cr>", "Open output window for Magma" },
      },
    }, {
      prefix = "<leader>l",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    })

    wk.register({
      m = {
        e = { "<cmd>MagmaEvaluateVisual<cr>", "Evaluate the current line" },
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
