local icons = require("utils.constants").icons

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    { "ahmedkhalf/project.nvim" },
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
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        layout_config = {
          anchor = "N",
          prompt_position = "top",
        },
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
      live_grep_args = {
        auto_quoting = true,
      },
      projects = {
        manual_mode = false,
        detection_methods = { "pattern" },
        patterns = { ".git", ".sln" },
        ignore_lsp = {},
        show_hidden = false,
        silent_chdir = true,
        datapath = vim.fn.stdpath("data"),
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("projects")
  end,
  keys = {
    {
      "<leader>fa",
      "<cmd>Telescope pickers<cr>",
      desc = "Telescope Actions",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Checkout branch",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fc",
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Files",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Find Help",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fk",
      "<cmd>Telescope keymaps<cr>",
      desc = "Keymaps",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ld",
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      desc = "Document Diagnostics",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ls",
      "<cmd>Telescope lsp_document_symbols<cr>",
      desc = "Document Symbols",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>lw",
      "<cmd>Telescope diagnostics<cr>",
      desc = "Workspace Diagnostics",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>lS ",
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      desc = "Workspace Symbols",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ur",
      "<cmd>Telescope resume<cr>",
      desc = "Last Telescope Actions",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Open Recent File",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>ft",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
      desc = "Find Text",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fw",
      "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>",
      desc = "Find Word under cursor",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fM",
      "<cmd>Telescope man_pages<cr>",
      desc = "Man Pages",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fR",
      "<cmd>Telescope registers<cr>",
      desc = "Registers",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>go",
      "<cmd>Telescope git_status<cr>",
      desc = "Open changed file",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    {
      "<leader>fp",
      "<cmd>Telescope projects<cr>",
      desc = "Find Projects",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
  },
}
