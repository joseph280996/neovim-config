local keymaps = {
  {
    mode = "n",
    lhs = "gd",
    rhs = "<cmd>lua require('omnisharp_extended').lsp_definition()<CR>",
    opts = { desc = "Go To Definition" },
  },
  {
    mode = "n",
    lhs = "gI",
    rhs = "<cmd>lua require('omnisharp_extended').lsp_implementation()<CR>",
    opts = { desc = "Go To Implementation" },
  },
  {
    mode = "n",
    lhs = "gr",
    rhs = "<cmd>lua require('omnisharp_extended').lsp_references()<CR>",
    opts = { desc = "Go To References" },
  },
  {
    mode = "n",
    lhs = "gT",
    rhs = "<cmd>lua require('omnisharp_extended').lsp_type_definition()<CR>",
    opts = { desc = "Go To References" },
  },
  {
    mode = "n",
    lhs = "gd",
    rhs = "<cmd>lua require('omnisharp_extended').lsp_definition()<CR>",
    opts = { desc = "Go To Definition" },
  },
  {
    mode = "n",
    lhs = "<leader>lni",
    rhs = "<cmd>DotnetUI new_item<cr>",
    opts = { desc = "Add new .NET sln/proj/globaljson item" },
  },
  {
    mode = "n",
    lhs = "<leader>lnf",
    rhs = "<cmd>DotnetUI file bootstrap<cr>",
    opts = { desc = "Bootstrapping a new C# file" },
  },
  {
    mode = "n",
    lhs = "<leader>lpra",
    rhs = "<cmd>DotnetUI project reference add<cr>",
    opts = { desc = "Add new Project reference" },
  },
  {
    mode = "n",
    lhs = "<leader>lppa",
    rhs = "<cmd>DotnetUI project package add<cr>",
    opts = { desc = "Add new Nuget Package" },
  },
}

require("utils.keymaps_setter")(0, keymaps)
