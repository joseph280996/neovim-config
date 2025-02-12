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
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    enable_git_status = false,
    enable_diagnostic = false,
    sort_case_insensitive = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "aerial" },
    default_component_configs = {
      indent = {
        -- expander config, needed for nesting files
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
      },
      modified = { symbol = "" },
      file_size = { enabled = false },
      type = { enabled = false },
      last_modified = { enabled = false },
      created = { enabled = false },
      symlink_target = { enabled = false },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leaves_dirs_open = false,
      },
      filtered_items = {
        show_hidden_count = false,
        visible = true,
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
          ["S"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
        },
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
    opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
    if vim.bo.filetype == "cs" then
      vim.tbl_extend("force", opts.filesystem.commands, {
        ["add_template"] = function(state)
          local node = state.tree:get_node()
          local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
          require("easy-dotnet").create_new_item(path, function()
            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,
      })
      vim.tbl_extend("force", opts.filesystem.mappings, {
        ["a"] = { "show_help", nowait = false, config = { title = "Add", prefix_key = "a" } },
        ["ae"] = { "add" },
        ["at"] = { "add_template" },
      })
    end
    require("neo-tree").setup(opts)
    require("lsp-file-operations").setup()
  end,
  keys = {
    {
      "<leader>xf",
      "<cmd>Neotree focus filesystem<cr>",
      desc = "Open/Focus on the Explorer",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>xr",
      "<cmd>Neotree focus filesystem reveal_force_cwd<cr>",
      desc = "Reveal the file in cwd and force change cwd",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>xx",
      "<cmd>Neotree close<cr>",
      desc = "Close the Explorer",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>xb",
      "<cmd>Neotree show buffers reveal<cr>",
      desc = "Explorer Opened Buffers",
      mode = "n", -- NORMAL mode
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
