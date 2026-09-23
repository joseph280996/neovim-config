if not vim.g.vscode then
  vim.keymap.set("n", "<leader>lni", "<cmd>Dotnet new<cr>", {
    buffer = 0,
    silent = true,
    desc = "Add new .NET sln/proj/globaljson item",
  })
  vim.keymap.set("n", "<leader>lpp", "<cmd>Dotnet add package<cr>", {
    buffer = 0,
    silent = true,
    desc = "Add new Nuget Package",
  })
end
