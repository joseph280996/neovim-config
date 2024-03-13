local get_values_on_os = require("user.utils.get-values-on-os")

return {
  "nvim-neorg/neorg",
  ft = "norg",
  cmd = "Neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "[Neorg]",
          },
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.mode"] = {},
        ["core.neorgcmd"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.highlights"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = get_values_on_os({
              Window = {
                school = "F:/Notebook/Personal/notes/School",
                personal = "F:/Notebook/Personal/notes/Personal",
              },
              Linux = {
                school = "~/Documents/notes/School/",
                personal = "~/Documents/notes/Personal/",
              },
            }, true),
          },
        },
        ["core.esupports.indent"] = {},
      },
    })
  end,
}
