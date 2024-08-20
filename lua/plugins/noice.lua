-- lazy.nvim
return {
  "folke/noice.nvim",
  enabled = true,
  commit = "d9328ef903168b6f52385a751eb384ae7e906c6f",
  event = "VeryLazy",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          col = "50%",
          row = 0
        },
      },
    },
    messages = {
      enabled = false,
    },
    lsp = {
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
}
