local icons = require("user.icons")

return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    opts = {
      defaults = {
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = "  ",
        path_display = { "smart" },
        file_ignore_patterns = {
          ".git/",
          "docs/",
          "vendor/",
          "__pycache__/",
          "node_modules/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "build/",
          "env/",
          ".idea/",
          "gradle/",
          "%.dll",
          "%.exe",
          "%.ipynb",
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
          theme = "dropdown",
        },
        grep_string = {
          only_sort_text = true,
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          initial_mode = "normal",
        },
        planets = {
          show_pluto = true,
          show_moon = true,
        },
        git_files = {
          theme = "dropdown",
          hidden = true,
          previewer = false,
          show_untracked = true,
        },
        lsp_references = {
          theme = "dropdown",
          initial_mode = "normal",
        },
        lsp_definitions = {
          theme = "dropdown",
          initial_mode = "normal",
        },
        lsp_declarations = {
          theme = "dropdown",
          initial_mode = "normal",
        },
        lsp_implementations = {
          theme = "dropdown",
          initial_mode = "normal",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
    config = function(_, opts)
      require('telescope').setup(opts)

      -- Because session.lua is loaded before telescope, we need 
      -- this here so that the loading order is correct
      require("telescope").load_extension("session-lens")
    end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },
  -- Fuzzy Finder
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
