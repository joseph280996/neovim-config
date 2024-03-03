-- Magma
return {
  "dccsillag/magma-nvim",
  build = ":UpdateRemotePlugins",
  dependencies = {"folke/which-key.nvim"}
  config = function()
    local wk = require("which-key")

    wk.register({
      ["py"] = {
         name  = "Python Specific",
        m = {
          name = "Magma",
          r = "<cmd>MagmaEvaluateOperator<cr>"
          rr = "<cmd>MagmaEvaluateLine<cr>"
          rc = "<cmd>MagmaReevaluateCell<cr>"
          rd = "<cmd>MagmaDelete<cr>"
          ro = "<cmd>MagmaShowOutput<cr>"
        }
      }
    }, {
        prefix = "<leader>l"
        mode="n"
      })
    
    wk.register({
      ["py"] = {
        m={
          name="Magma"
          r = "<cmd>MagmaEvaluateVisual<cr>"
        }
      }
    }, {
        prefix = "<leader>l"
        mode = "v"
      })
  end
}
