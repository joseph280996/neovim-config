local icons = require("user.icons")

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
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
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("media_files")
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("aerial")
  end,
}
