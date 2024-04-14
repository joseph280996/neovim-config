-- Session
return {
  -- Session
  {
    "rmagatti/session-lens",
    dependencies = {
      "rmagatti/auto-session",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("session-lens")
    end,
  },
  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = {
        "~/",
        "~/Downloads",
        "~/Code/Project",
        "~/Work",
        "~/Code/Research",
      },
      auto_session_enable_last_session = false,
      auto_save_enabled = true,
      auto_session_enabled = true,
    },
    keys = {
      {
        "<leader>SD",
        "<cmd>SessionDelete<cr>",
        desc = "Delete Session",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>SR",
        "<cmd>SessionRestore<cr>",
        desc = "Restore Session",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>SS",
        "<cmd>SessionSave<cr>",
        desc = "Save Session",
        mode = "n", -- NORMAL mode
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
