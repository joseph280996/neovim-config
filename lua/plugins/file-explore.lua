local function open_nvim_tree(data)
  local IGNORED_FT = {
    "startify",
    "dashboard",
    "alpha",
  }

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- &ft
  local filetype = vim.bo[data.buf].ft

  -- only files please
  if not real_file and not no_name then
    return
  end

  -- skip ignored filetypes
  if vim.tbl_contains(IGNORED_FT, filetype) then
    return
  end

  -- open the tree but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false })
end

local closeIfLast = function()
  local tree_wins = {}
  local floating_wins = {}
  local wins = vim.api.nvim_list_wins()
  for _, w in ipairs(wins) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
    if bufname:match("NvimTree_") ~= nil then
      table.insert(tree_wins, w)
    end
    if vim.api.nvim_win_get_config(w).relative ~= "" then
      table.insert(floating_wins, w)
    end
  end
  if 1 == #wins - #floating_wins - #tree_wins then
    -- Should quit, so we close all invalid windows.
    for _, w in ipairs(tree_wins) do
      vim.api.nvim_win_close(w, true)
    end
  end
end

-- Tree
return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  cmd = "NvimTreeToggle",
  opts = {
    git = {
      ignore = false,
    },
    hijack_directories = {
      enable = false,
    },
    filters = {
      custom = { ".git" },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = {},
    },
    actions = {
      expand_all = {
        max_folder_discovery = 300,
        exclude = {
          "node_modules",
          ".vscode",
          "vendors",
          ".pycache",
          "build",
          ".env",
          ".git",
          "target",
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)

    vim.api.nvim_create_autocmd("QuitPre", {
      callback = closeIfLast,
    })

    -- Auto Command register
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end,
}
