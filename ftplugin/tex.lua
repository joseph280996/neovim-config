local settings = {
  wrap = true,
  textwidth = 80,
  linebreak = true,
  breakindent = true
}

for setting, value in pairs(settings) do
  vim.opt_local[setting] = value
end
