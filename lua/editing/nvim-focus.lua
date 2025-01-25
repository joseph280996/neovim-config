local ignore_filetypes = {
  "lazy",
  "NvimTree",
  "help",
  "neotest-summary",
  "TelescopePrompt",
  "alpha",
  "aerial",
  "tex",
  "no-neck-pain",
}

local ignore_buftypes = { "nofile", "prompt", "popup" }

return {
  "nvim-focus/focus.nvim",
  version = "*",
  event = "BufEnter",
  opts = {
    ui = {
      winhighlight = true
    }
  },
  config = function()
    require("focus").setup()

    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      desc = "Disable focus autoresize for BufType",
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
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
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        else
          vim.b.focus_disable = false
        end
      end,
    })
  end,
  keys = {
    {
      "<leader>bh",
      "<cmd>FocusSplitLeft<cr>",
      desc = "Focus Left",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>bj",
      "<cmd>FocusSplitDown<cr>",
      desc = "Focus Down",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>bk",
      "<cmd>FocusSplitUp<cr>",
      desc = "Focus Up",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>bl",
      "<cmd>FocusSplitRight<cr>",
      desc = "Focus Right",
      mode = "n",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
