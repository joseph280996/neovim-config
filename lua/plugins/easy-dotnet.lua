return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
  config = function()
    local dotnet = require("easy-dotnet")
    dotnet.setup({
      csproj_mappings = true,
      fsproj_mappings = true,
      auto_bootstrap_namespace = {
        type = "block_scoped",
        enabled = true,
      },
      picker = "snacks",
      notifications = {
        handler = false,
      },
    })
  end,
}
