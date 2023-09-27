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
            workspaces = {
              school = "~/Documents/notes/School/",
              personal = "~/Documents/notes/Personal/",
            },
          },
        },
        ["core.esupports.indent"] = {},
      },
    })
  end,
}
