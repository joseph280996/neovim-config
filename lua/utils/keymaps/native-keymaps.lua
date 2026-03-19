return {
      --[[ BUFFER OPEARTION ]]
      { "<leader>b", group = "Buffer" },
      { "<leader>bx", "<cmd>bdelete!<CR>", desc = "Close Buffer" },
  --[[ FIND OPs ]]
  { "<leader>f", group = "Find" },
  { "<leader>ff", group = "Find Files" },
  { "<leader>g", group = "Git" },
  { "<leader>gd", group = "Git Diff" },
  { "<leader>gdf", group = "Git Diff File" },

  { "<leader>h", group = "Hardtime" },

  --[[ LSP OPs ]]
  { "<leader>l", group = "LSP" },
  { "<leader>lf", group = "Fix" },
  { "<leader>ld", group = "Diagnostics" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  { "<leader>e", group = "Editing" },
  { "<leader>ed", group = "Code Doc" },
  { "<leader>c", group = "Comment", mode = "v" },

  { "<leader>u", group = "Utilities" },
  { "<leader>uk", group = "Kulala" },
  { "<leader>ut", group = "Tab Related" },

  { "<leader>x", group = "Explorer" },
  { "<leader>m", group = "Molten" },
  {
    "<leader>mn",
    "<cmd>NewJupyterNotebook main<cr>",
    desc = "Initialize an empty JupyterNotebook",
  },
  { "<leader>mc", group = "Molten Cell Navigation" },
  { "<leader>me", group = "Molten Evaluate" },
  { "<leader>m", group = "Molten", mode = "v" },
  { "<leader>n", group = "Notes" },
  { "<leader>v", group = "Vim Packages" },
  { "<leader>vt", group = "VimTex" },
  { "<leader>s", group = "Surround" },

  --[[ UNIT TESTING ]]
  { "<leader>T", group = "Unit Testing" },
  { "<leader>TR ", group = "Run" },
  { "<leader>TW ", group = "Watch" },
  { "<leader>Tc", group = "Coverage" },

  --[[ DAP OPs ]]
  { "<leader>d", group = "Debug" },

  --[[ PACKAGES OPs ]]
  { "<leader>p", group = "Packages Manager" },
  { "<leader>po", "<cmd>Lazy<cr>", desc = "Open Lazy Screen" },
  { "<leader>pu", "<cmd>Lazy <cr>", desc = "Open Lazy Screen" },
  { "<leader>ph", "<cmd>Lazy health<cr>", desc = "Health" },
  { "<leader>pm", "<cmd>Mason<cr>", desc = "Open Mason" },

  --[[ Notes ]]
  { "<leader>z", group = "Notes" },

  --[[ Layer 2 ]]
  { "<leader><leader>", group = "Layer 2" },
  { "<leader><leader>c", group = "Layer 2" },
}
