return {
  "rebelot/kanagawa.nvim",
  config = function(_, opts)
    local colorscheme = "kanagawa"

    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
      return
    end
  end,
}
