vim.filetype.add({
  pattern = {
    ["Jenkinsfile.*"] = "groovy",
  },
  filename = {
    ["Jenkinsfile"] = "groovy",
  },
})
