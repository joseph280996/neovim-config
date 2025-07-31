local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS

return {
  {
    "GCBallesteros/jupytext.nvim",
    lazy = false,
    opts = {
      custom_language_formatting = {
        python = {
          extension = "md",
          style = "markdown",
          force_ft = "markdown"
        }
      }
    },
  },
  {
    "benlubas/molten-nvim",
    ft = "ipynb",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = "willothy/wezterm.nvim",
    init = function()
      vim.g.molten_image_provider = "wezterm"
      vim.g.molten_auto_open_output = false
      vim.g.molten_auto_image_popup = true
      vim.g.molten_split_direction = "bottom"
      vim.g.molten_split_size = 20
    end,
    keys = {
      vim.tbl_deep_extend("force", {
        "<leader>mi",
        "<cmd>MoltenInit<cr>",
        desc = "Initialize Python",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>meo",
        "<cmd>MoltenEvaluateOperator<cr>",
        desc = "Evaluate Operator",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>mel",
        "<cmd>MoltenEvaluateLine<cr>",
        desc = "Evaluate Whole Line",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>mec",
        "<cmd>MoltenReevaluateCell<cr>",
        desc = "Reevaluate Current Cell",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>md",
        "<cmd>MoltenDelete<cr>",
        desc = "Delete Active Cell",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>mo",
        "<cmd>MoltenEnterOutput<cr>",
        desc = "Show Output",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>ms",
        "<cmd>MoltenSave<cr>",
        desc = "Save Cell Output",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>ml",
        "<cmd>MoltenLoad<cr>",
        desc = "Load Cell Output",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>me",
        "<cmd>MoltenEvaluateVisual<cr>",
        desc = "Evaluate Selection",
        mode = "v",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>mcn",
        "<cmd>MoltenNext<cr>",
        desc = "Go to next cell",
      }, KEYBINDING_OPTS),
      vim.tbl_deep_extend("force", {
        "<leader>mcp",
        "<cmd>MoltenPrev<cr>",
        desc = "Go to previous cell",
      }, KEYBINDING_OPTS),
    },
  }
}
