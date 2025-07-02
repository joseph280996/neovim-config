local ignore_filetypes = {
  "lazy",
  "NvimTree",
  "help",
  "neotest-summary",
  "alpha",
  "aerial",
  "tex",
  "no-neck-pain",
}

local ignore_buftypes = { "nofile", "prompt", "popup" }

return {
  ignore_buftypes = ignore_buftypes,
  ignore_filetypes = ignore_filetypes,
}
