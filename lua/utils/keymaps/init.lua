if vim.g.vscode then
  return require("utils.keymaps.vscode-keymaps")
else
  return require("utils.keymaps.native-keymaps")
end
