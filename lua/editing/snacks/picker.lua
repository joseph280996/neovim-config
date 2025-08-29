
local constants = require("utils.constants")
local get_values_on_os = require("utils.get-values-on-os")

local custom_layout = {
  preset = "vscode",
  layout = {
    [2] = { win = "list", border = "rounded" },
  },
}
return {
  enabled = true,
  sources = {
    smart = {
      layout = vim.tbl_deep_extend("keep", { preview = "main" }, custom_layout),
      filter = { cwd = true },
    },
    project = {
      dev = {
        "~/.confg",
        "~/Code/Personal/",
        "~/Code/School/",
        get_values_on_os({ [constants.WINDOW] = "D:/Notebook/", [constants.LINUX] = "/mnt/d/Notebook/" }),
      },
      patterns = { ".git", "lazy-lock.json", "package.json", "Makefile", "README.md", ".zk" },
      layout = custom_layout
    },
    lsp_definitions = {
      layout = custom_layout,
    },
    lsp_declarations = {
      layout = custom_layout,
    },
    lsp_symbols = {
      layout = custom_layout,
      filter = {
        lua = true,
      },
    },
  },
  matcher = {
    cwd_bonus = true,
  },
}
