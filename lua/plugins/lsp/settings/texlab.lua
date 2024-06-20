return {
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      build = {
        onSave = false,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = false,
      },
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}
