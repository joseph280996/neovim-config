-- Import
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

-- Configurations

local actiosn = require 'telescope.actions'
telescope.load_extension 'media_files'
local icons = require "user.icons"

telescope.setup {
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
            hidden = true,
            previewer = false,
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
            case_mode = "smart_case"
        }
    }
}

vim.keymap.set("n", "<c-p>", "<cmd>Telescope find_files<cr>")
