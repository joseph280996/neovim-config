if not vim.g.vscode then
  local maps = {
    { "<leader>jtc", "<cmd>lua require('jdtls').test_class()<cr>", "Test class" },
    { "<leader>jtn", "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test nearest method" },
    { "<leader>jev", "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variables" },
    { "<leader>jem", "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Methods" },
    { "<leader>ji", "<cmd>lua require('jdtls').organize_imports()<cr>", "Import Organize" },
  }

  for _, m in ipairs(maps) do
    vim.keymap.set("n", m[1], m[2], { buffer = 0, silent = true, desc = m[3] })
  end
end
