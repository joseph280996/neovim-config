local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  -- Diagnosis
  "folke/trouble.nvim",
  lazy = false,
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    auto_close = true,
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>ldb",
      "<cmd>Trouble diagnostics toggle focus filter.buf=0 win={type=split, position=right}<cr>",
      desc = "Troubles in Buffer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ldq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble Quickfix",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ldl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble in LocList",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ldo",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle Trouble",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ldr",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Trouble LSP refs",
    }, KEYBINDING_OPTS),
  },
}
