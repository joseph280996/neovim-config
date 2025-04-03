local keymaps = {
  {
    "gd",
    "<cmd>lua require('omnisharp_extended').lsp_definition()<CR>",
    mode = "n",
    desc = "Go To Definition",
  },
  {
    "gI",
    "<cmd>lua require('omnisharp_extended').lsp_implementation()<CR>",
    mode = "n",
    desc = "Go To Implementation",
  },
  {
    "gr",
    "<cmd>lua require('omnisharp_extended').lsp_references()<CR>",
    mode = "n",
    desc = "Go To References",
  },
  {
    "gT",
    "<cmd>lua require('omnisharp_extended').lsp_type_definition()<CR>",
    mode = "n",
    desc = "Go To References",
  },
  {
    "gd",
    "<cmd>lua require('omnisharp_extended').lsp_definition()<CR>",
    mode = "n",
    desc = "Go To Definition",
  },
  {
    "<leader>lni",
    "<cmd>DotnetUI new_item<cr>",
    mode = "n",
    desc = "Add new .NET sln/proj/globaljson item",
  },
  {
    "<leader>lnf",
    "<cmd>DotnetUI file bootstrap<cr>",
    mode = "n",
    desc = "Bootstrapping a new C# file",
  },
  {
    "<leader>lpra",
    "<cmd>DotnetUI project reference add<cr>",
    mode = "n",
    desc = "Add new Project reference",
  },
  {
    "<leader>lppa",
    "<cmd>DotnetUI project package add<cr>",
    mode = "n",
    desc = "Add new Nuget Package",
  },
}

local wk = require("which-key")
wk.add(keymaps)
