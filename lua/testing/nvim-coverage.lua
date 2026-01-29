return {
  "andythigpen/nvim-coverage",
  version = "*",
  keys = {
    { "<leader>Tc", group = "Coverage" },
    {
      "<leader>Tcc",
      function()
        require("coverage").load(true)
      end,
      desc = "Load coverage",
    },
    {
      "<leader>Tct",
      function()
        require("coverage").toggle()
      end,
      desc = "Toggle coverage signs",
    },
    {
      "<leader>Tcs",
      function()
        require("coverage").summary()
      end,
      desc = "Coverage summary",
    },
    {
      "<leader>Tcl",
      function()
        require("coverage").load_lcov(vim.fn.expand("%:p:h") .. "/", true)
      end,
      desc = "Load coverage from cwd",
    },
    {
      "<leader>TcL",
      function()
        vim.ui.input({ prompt = "Lcov file path: ", completion = "file" }, function(path)
          if path and path ~= "" then
            require("coverage").load_lcov(path, true)
          end
        end)
      end,
      desc = "Load specific lcov file",
    },
    {
      "<leader>TcC",
      function()
        require("coverage").clear()
      end,
      desc = "Clear coverage",
    },
  },
  config = function()
    require("coverage").setup({
      auto_reload = true,
    })
  end,
}
