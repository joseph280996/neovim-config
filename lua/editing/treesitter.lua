local enabled_ft = require("utils.constants.tree-sitter-enabled-ft")

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(enabled_ft)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = enabled_ft,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
