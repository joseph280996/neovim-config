return {
  "ravitemer/mcphub.nvim",
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "bundled_build.lua", -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup({
      use_bundled_binary = true
    })
  end,
}
