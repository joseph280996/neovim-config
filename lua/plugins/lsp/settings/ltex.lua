return {
  filetypes = { "tex", "bib" },
  settings = {
    ltex = {
      enabled = { "tex" },
      language = "auto",
      diagnositcSeverity = "information",
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en",
      },
      dictionary = {
        ["en-US"] = { "" },
      },
    },
  },
}
