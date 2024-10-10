return {
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      build = {
        onSave = false,
      },
      chktex = {
        onOpenAndSave = false,
        onEdit = false,
      },
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}
