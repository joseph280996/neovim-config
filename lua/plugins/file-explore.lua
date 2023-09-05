return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  config = function()
    require("neo-tree").setup({
      open_files_do_not_replace_types = { "terminal", "trouble", "aerial" },
      default_component_configs = {
        icon = {
          folder_empty = "󰜌",
          default = "*",
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_marker = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        nesting_rules = {},
        file_size = { enabled = false },
        type = { enabled = false },
        last_modified = { enabled = false },
        created = { enabled = false },
        symlink_target = { enabled = false },
        filesystem = {
          filtered_items = {
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
          },
          follow_current_file = {
            enabled = true,
            leaves_dirs_open = false,
          }
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          show_unloaded = true,
        },
      },
    })
  end,
}

-- DEPRECATED: NvimTree configs
--[[
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

-- NvimTree
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
      dotfiles = false,
    },
    update_focused_file = {
      enable = true,
      ignore_list = {},
    },
    sync_root_with_cwd = true,
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
  end,
}]]
