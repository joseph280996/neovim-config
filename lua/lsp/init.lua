return {
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = { "cs" },
  },
  {
    "MoaidHathot/dotnet.nvim",
    cmd = "DotnetUI",
    opts = {
      bootstrap = {
        auto_bootstrap = true, -- Automatically call "bootstrap" when creating a new file, adding a namespace and a class to the files
      },
    },
  },
}
