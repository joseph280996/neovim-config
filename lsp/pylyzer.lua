return {
  on_new_config = function(new_config, _)
     vim.fn.setenv("ERG_PATH", vim.fn.getenv("HOME") .. "/.erg")
  end,
}
