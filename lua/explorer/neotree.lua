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
      file_size = { enabled = false },
      type = { enabled = false },
      last_modified = { enabled = false },
      created = { enabled = false },
      symlink_target = { enabled = false },
    },
    filesystem = {
      window = {
        async_directory_scan = "always",
      },
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
