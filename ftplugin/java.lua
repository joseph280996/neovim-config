if not vim.g.vscode then
  local keymaps = {
    {
      "<leader>jtc",
      "<cmd>lua require('jdtls').test_clas()<cr>",
      mode = "n",
      desc = "Test class",
    },
    {
      "<leader>jtn",
      "<cmd>lua require('jdtls').test_nearest_method()<cr>",
      mode = "n",
      desc = "Test nearest method",
    },
    {
      "<leader>jev",
      "<cmd>lua require('jdtls').extract_variable(true)<cr>",
      mode = "n",
      desc = "Extract Variables",
    },
    {
      "<leader>jem",
      "<cmd>lua require('jdtls').extract_method(true)<cr>",
      mode = "n",
      desc = "Extract Methods",
    },
    {
      "<leader>ji",
      "<cmd>lua require('jdtls').organize_imports()<cr>",
      mode = "n",
      desc = "Import Organize",
    },
  }

  local wk = require("which-key")
  wk.add(keymaps)
end
