return {
  "bahaaza/mcphub.nvim", -- TODO: Remove when https://github.com/ravitemer/mcphub.nvim/pull/279 merged
  -- "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "bundled_build.lua", -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup({ use_bundled_binary = true })
  end,
}
