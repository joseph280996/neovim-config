if not vim.g.vscode then
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
      "<cmd>Dotnet new<cr>",
      mode = "n",
      desc = "Add new .NET sln/proj/globaljson item",
    },
    {
      "<leader>lpp",
      "<cmd>Dotnet add package<cr>",
      mode = "n",
      desc = "Add new Nuget Package",
    },
  }

  local wk = require("which-key")
  wk.add(keymaps)
end
