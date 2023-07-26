local ignore_filetypes = {
  "lazy",
  "NvimTree",
  "help",
  "neotest-summary",
  "TelescopePrompt",
  "alpha",
}

local ignore_buftypes = { "nofile", "prompt", "popup" }

return {
  "nvim-focus/focus.nvim",
  version = "*",
  config = function()
    require("focus").setup()

    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    vim.api.nvim_create_autocmd( "WinEnter" , {
      group = augroup,
      desc = "Disable focus autoresize for BufType",
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
          vim.b.focus_disable = true
        end
      end,
    })

    vim.api.nvim_create_autocmd( "FileType", {
      group = augroup,
      desc = "Disable focus autoresize for FileType",
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        end
      end,
    })
  end,
}
