return {
  filetypes = { "tex", "bib", "markdown" },
  settings = {
    ltex = {
      enabled = { "tex", "markdown" },
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
