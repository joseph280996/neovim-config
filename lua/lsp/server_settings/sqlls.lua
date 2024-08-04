return {
  root_dir = function()
    return vim.fs.dirname(
      vim.fs.find(
        { "ReadMe.md", "README.md", "Readme.md", ".gitignore", "properties", ".gitmodule" },
        { upward = true }
      )[1]
    )
  end,
  settings = {},
}
