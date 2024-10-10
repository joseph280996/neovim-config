return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        cpp = { "cppcheck" },
        tex = { "chktex" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        markdown = { "vale" },
        cmake = { "cmakelint" },
      }
    end,
  },
}
