local keymaps = {
  {
    mode = "n",
    lhs = "<leader>jtc",
    rhs = "<cmd>lua require('jdtls').test_clas()<cr>",
    opts = { desc = "Test class" },
  },
  {
    mode = "n",
    lhs = "<leader>jtn",
    rhs = "<cmd>lua require('jdtls').test_nearest_method()<cr>",
    opts = { desc = "Test nearest method" },
  },
  {
    mode = "n",
    lhs = "<leader>jev",
    rhs = "<cmd>lua require('jdtls').extract_variable(true)<cr>",
    opts = { desc = "Extract Variables" },
  },
  {
    mode = "n",
    lhs = "<leader>jem",
    rhs = "<cmd>lua require('jdtls').extract_method(true)<cr>",
    opts = { desc = "Extract Methods" },
  },
  {
    mode = "n",
    lhs = "<leader>ji",
    rhs = "<cmd>lua require('jdtls').organize_imports()<cr>",
    opts = { desc = "Import Organize" },
  },
}

require("utils.keymaps_setter")(0, keymaps)
