local status_ok, autosession = pcall(require, 'auto-session')
if not status_ok then
  return
end

autosession.setup {
  log_level="error",
  auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Code/Project", "~/Work", "~/Code/Research" },
  auto_session_enable_last_session = false,
  auto_save_enabled = true,
  auto_session_enabled = true,
}
