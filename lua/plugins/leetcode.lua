return {
  "kawre/leetcode.nvim",
  commit = "d3e9c6a6cdde3dce2f1b2853f74589ce07d7616c",
  cmd = "Leet",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "folke/snacks.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    arg = "leetcode.nvim",
    lang = "cpp",
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },
    plugins = {
      non_standalone = true,
    },
    logging = true,
    injector = {
      ["cpp"] = {
        imports = function(_)
          -- return a different list to omit default imports
          return { "#include<vector>" }
        end,
      },
    },
    cache = {
      update_interval = 60 * 60 * 24 * 7,
    },
    console = {
      open_on_runcode = true,
      dir = "row",
      size = {
        width = "90%",
        height = "75%",
      },
      result = {
        size = "60%",
      },
      testcase = {
        virt_text = true,
        size = "40%",
      },
    },
    description = {
      position = "left",
      width = "40%",
      show_stats = true,
    },
    picker = { provider = "snacks-picker" },
    hooks = {
      ["enter"] = {},
      ["question_enter"] = {},
      ["leave"] = {},
    },
    keys = {
      toggle = { "q" },
      confirm = { "<CR>" },
      reset_testcases = "r",
      use_testcase = "U",
      focus_testcases = "H",
      focus_result = "L",
    },
    theme = {},
    image_support = false,
  },
}
