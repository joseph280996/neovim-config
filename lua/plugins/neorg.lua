local get_values_on_os = require("utils.get-values-on-os")

return {
  {
    "folke/which-key.nvim", -- Centralized list of all commands UI
    optional = true,
    opts = {
      keymaps_ext = {
        n = { name = "Notes" },
      },
    },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = "Neorg",
    dependencies = { "luarocks.nvim" },
    opts = {
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
    },
    keys = {
      {
        "<leader>nww",
        "<cmd>Neorg workspace work<cr>",
        desc = "Open Work Workspace",
        mode = "n",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>nws",
        "<cmd>Neorg workspace school<cr>",
        desc = "Open School Workspace",
        mode = "n",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
      {
        "<leader>nwp",
        "<cmd>Neorg workspace personal<cr>",
        desc = "Open Personal Workspace",
        mode = "n",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
      },
    },
  },
}
