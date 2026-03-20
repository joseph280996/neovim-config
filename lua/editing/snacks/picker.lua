local constants = require("utils.constants")
local get_values_on_os = require("utils.get-values-on-os")

local KEYBINDING_OPTS = constants.KEYBINDING_OPTS

local custom_layout = {
  preset = "vscode",
  layout = {
    [2] = { win = "list", border = "rounded" },
  },
}
return {
  config = {
    enabled = true,
    sources = {
      smart = {
        layout = vim.tbl_deep_extend("keep", { preview = "main" }, custom_layout),
        filter = { cwd = true },
      },
      files = {
        hidden = true,
        ignore = true,
        exclude = { "**/*/node_modules/**", "**/*.git/**", "**/package-lock.json" },
      },
      grep = {
        hidden = true,
        ignore = true,
        exclude = { "**/*/node_modules/**", "**/*.git/**", "**/package-lock.json" },
      },
      project = {
        dev = vim.list_extend(
          {
            "~/.confg",
            "~/Code/Personal/",
            "~/Code/Work/",
          },
          get_values_on_os({
            [constants.WINDOW] = {
              "D:/Notebook/",
            },
            [constants.LINUX] = { "/mnt/d/Notebook/" },
            [constants.DARWIN] = {
              "~/Documents/knowledge-base/",
              "~/Documents/notes/",
            },
          }, false)
        ),
        patterns = { ".git", "lazy-lock.json", "package.json", "Makefile", "README.md", ".zk" },
        layout = custom_layout,
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
  },
  keys = {
    vim.tbl_deep_extend("force", {
      "<leader>xo",
      function()
        Snacks.picker.lsp_symbols({
          layout = {
            preset = "right",
          },
        })
      end,
      desc = "Open Symbols Explorer",
    }, KEYBINDING_OPTS),

    -- Find
    vim.tbl_deep_extend("force", {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ff",
      function()
        Snacks.picker.smart()
      end,
      desc = "Files",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fs",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>ft",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find Text",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fT",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Find Text in Open Bufferes",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      mode = { "n", "x" },
      desc = "Find Word under cursor or selection",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fR",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Find Projects",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "<leader>er",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume Last Actions",
    }, KEYBINDING_OPTS),

    -- LSP
    vim.tbl_deep_extend("force", {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Go to Definition",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Go to Declaration",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "gri",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Go To Implementation",
    }, KEYBINDING_OPTS),
    vim.tbl_deep_extend("force", {
      "grr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "Go To References",
    }, KEYBINDING_OPTS),

    -- Utilities
    vim.tbl_deep_extend("force", {
      "<leader>eu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo Tree",
    }, KEYBINDING_OPTS),
  },
}
