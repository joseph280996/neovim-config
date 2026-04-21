local options = {
  python3_host_prog = "python3",
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
  lasttab = 1,
}

for setting, value in pairs(options) do
  vim.g[setting] = value
end

