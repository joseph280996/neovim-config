local KEYBINDING_OPTS = require("utils.constants").KEYBINDING_OPTS
return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
    "saifulapm/neotree-file-nesting-config",
  },
  opts = {
    open_files_do_not_replace_types = { "terminal", "trouble", "aerial", "qf" },
    default_component_configs = {
      indent = {
        -- expander config, needed for nesting files
        with_expanders = true, -- If nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
      },
      modified = { symbol = "" },
      file_size = { enabled = false },
      type = { enabled = false },
      last_modified = { enabled = false },
      created = { enabled = false },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leaves_dirs_open = false,
      },
      filtered_items = {
        hide_gitignore = false,
        hide_dotfiles = false,
        hide_hidden = false,
        never_show = {
          ".DS_Store",
        },
      },
      hijack_netrw_behavior = "disabled",
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ["s"] = "open_vsplit",
          ["S"] = "open_split",
          ["<C-s>"] = "vsplit_with_window_picker",
          ["<C-S>"] = "split_with_window_picker",
          ["a"] = { "show_help", nowait = false, config = { title = "Add", prefix_key = "a" } },
          ["ae"] = { "add" },
          ["at"] = { "add_template" },
        },
      },
      commands = {
        ["add_template"] = function(state)
          local node = state.tree:get_node()
          local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
          require("easy-dotnet").create_new_item(path, function()
            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      show_unloaded = true,
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.cmd("highlight! Cursor blend=100")
        end,
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
        end,
      },
    },
  },
  config = function(_, opts)
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end
    local events = require("neo-tree.events")
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })
    opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
    require("neo-tree").setup(opts)
  end,
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>xf",
      "<cmd>Neotree filesystem reveal left toggle<cr>",
      desc = "Open/Focus on the Explorer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>xx",
      "<cmd>Neotree close<cr>",
      desc = "Close the Explorer",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>xb",
      "<cmd>Neotree show buffers reveal<cr>",
      desc = "Explorer Opened Buffers",
    }, KEYBINDING_OPTS),
  },
}
