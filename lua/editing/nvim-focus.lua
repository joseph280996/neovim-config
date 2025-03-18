local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
local ignores = require("utils.constants.ignores")

return {
  "nvim-focus/focus.nvim",
  version = "*",
  event = "BufEnter",
  opts = {
    ui = {
      winhighlight = true,
    },
  },
  config = function()
    require("focus").setup()
    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      desc = "Disable focus autoresize for BufType",
      callback = function(_)
        if vim.tbl_contains(ignores.ignore_buftypes, vim.bo.buftype) then
          vim.w.focus_disable = true
        else
          vim.w.focus_disable = false
        end
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      desc = "Disable focus autoresize for FileType",
      callback = function(_)
        if vim.tbl_contains(ignores.ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        else
          vim.b.focus_disable = false
        end
      end,
    })
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>bh",
      "<cmd>FocusSplitLeft<cr>",
      desc = "Focus Left",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>bj",
      "<cmd>FocusSplitDown<cr>",
      desc = "Focus Down",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>bk",
      "<cmd>FocusSplitUp<cr>",
      desc = "Focus Up",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>bl",
      "<cmd>FocusSplitRight<cr>",
      desc = "Focus Right",
    }, KEYBINDING_OPTS),
  },
}
