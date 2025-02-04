local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

-- Statusline
return {
  "christianchiarulli/lualine.nvim",
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
    },
    sections = {
      lualine_a = {
        "mode",
      },
      lualine_b = {
        {
          "macro-recording",
          fmt = show_macro_recording,
        },
        {
          "filename",
          file_status = true,
          path = 1,
        },
      },
      lualine_c = { "branch" },
      lualine_x = {},
      lualine_y = { "encoding", "fileformat", "filetype" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
  tabline = {
    {
      lualine_a = {
        "mode",
      },
      lualine_b = {
        {
          "macro-recording",
          fmt = show_macro_recording,
        },
        {
          "filename",
          file_status = true,
          path = 1,
        },
      },
      lualine_c = { "branch" },
      lualine_x = {},
      lualine_y = { "encoding", "fileformat", "filetype" },
      lualine_z = { "location" },
    },
  },
}
