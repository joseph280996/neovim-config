return {
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      build = {
        onSave = true,
      },
      lint = {
        onSave = true,
      },
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}
