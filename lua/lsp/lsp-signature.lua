return {
  "ray-x/lsp_signature.nvim",
  event = { "BufReadPost", "BufWritePost", "InsertLeave", "InsertEnter" },
  opts = {
    always_trigger = true,
    transparency = 10,
    handler_opts = {
      border = "rounded",
    },
  },
}
