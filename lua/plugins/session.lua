-- Session
return {
  -- Session
  {
    "rmagatti/session-lens",
    dependencies = {
      "rmagatti/auto-session",
      "nvim-telescope/telescope.nvim",
    },
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
  },
}
