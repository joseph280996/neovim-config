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
      "<leader>ltd",
      "<cmd>Trouble diagnostics toggle focus filter.buf=0 win={type=split, position=right}<cr>",
      desc = "Troubles in Buffer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ltf",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble Quickfix",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ltl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble in LocList",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>lto",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle Trouble",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ltr",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Trouble LSP refs",
    }, KEYBINDING_OPTS),
  },
}
