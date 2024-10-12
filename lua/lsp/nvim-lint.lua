return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePost", "BufReadPost", "InsertLeave", "InsertEnter" },
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
}
