return {
  "GCBallesteros/jupytext.nvim",
  ft = "ipynb",
  opts = {
    custom_language_formatting = {
      python = {
        extension = "md",
        style = "markdown"
      }
    }
  },
  -- Depending on your nvim distro or config you may need to make the loading not lazy
}
