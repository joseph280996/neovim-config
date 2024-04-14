local settings = {
  wrap = true,
  breakindent = true,
  linebreak = true,
  tw = 80,
}

for setting, value in pairs(settings) do
  vim.opt_local[setting] = value
end
