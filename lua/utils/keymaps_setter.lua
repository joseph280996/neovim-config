return function(bufnr, bindings)
  local keymap_setter = vim.api.nvim_buf_set_keymap
  for _, keybinding in ipairs(bindings) do
    keymap_setter(
      bufnr,
      keybinding.mode,
      keybinding.lhs,
      keybinding.rhs,
      vim.tbl_deep_extend("keep", require("utils.constants").KEYBINDING_OPTS, keybinding.opts)
    )
  end
end
