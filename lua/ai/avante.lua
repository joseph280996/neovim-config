local get_values_on_os = require("utils.get-values-on-os")
return {
  "yetone/avante.nvim",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    behavior = {
      auto_set_highlight_group = false,
    },
    mappings = {
      diff = {
        ours = "<leader>uaco",
        theirs = "<leader>uact",
        all_theirs = "<leader>uaca",
        cursor = "<leader>uacc",
        next = "<leader>ua]x",
        prev = "<leader>ua[x",
        both = "<leader>uacb",
      },
      suggestion = {
        accept = "<leader>uasl",
        next = "<leader>uas]",
        prev = "<leader>uas[",
        dismiss = "<leader>uasd",
      },
      jump = {
        next = "<leader>uaj]",
        prev = "<leader>uaj[",
      },
      submit = {
        normal = "<CR>",
        insert = "<leader>uasi",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = get_values_on_os({
    Linux = "make",
    Window = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
  }, true),
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = get_values_on_os({ Linux = false, Window = true }),
        },
      },
    },
  },
  keys = {
    { "<leader>uaa", "<cmd>AvanteAsk<cr>", desc = "AI Ask" },
    { "<leader>uar", "<cmd>AvanteRefresh<cr>", desc = "AI Refresh" },
    { "<leader>uae", "<cmd>AvanteEdit<cr>", desc = "AI Edit prompt" },
  },
}
