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
      enable_git_status = false,
      enable_diagnostic = true,
      sort_case_insensitive = true,
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
            hide_by_name = {
              "package-lock.json",
              "lazy-lock.json.json"
            }
          },
          follow_current_file = {
            enabled = true,
            leaves_dirs_open = false,
          },
          use_libuv_file_watcher = true
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

