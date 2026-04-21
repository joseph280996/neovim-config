if not vim.g.vscode then
  local keymaps = {
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
