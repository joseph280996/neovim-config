local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  dependencies = {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  opts = {
    options = {
      icon_enabled = true,
      -- theme = "nord",
      -- theme = "catppuccin",
      theme = "kanagawa",
      -- theme = "kanagawa_paper",
      component_separators = { left = "", right = "" },
      section_separators = { left = " ", right = " " },
      disabled_filetypes = { "alpha", "dashboard" },
      always_show_tabline = true,
    },
    sections = {
      lualine_a = {
        "mode",
      },
      lualine_b = {
        { "searchcount" },
        { "macro-recording", fmt = show_macro_recording },
      },
      lualine_c = { "branch", "diff" },
      lualine_x = { "filesize" },
      lualine_y = { "encoding", "fileformat", "filetype" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "filesize" },
      lualine_y = { "encoding", "fileformat", "filetype" },
      lualine_z = { "location" },
    },
    extensions = {
      "neo-tree",
      "aerial",
      "trouble",
      "lazy",
    },
  },
}
