vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, noremap = true })

nvim_tree.setup({
    hijack_directories = {
        enable = false,
    },
    filters = {
        custom = { ".git" },
        exclude = { ".gitignore" },
    },
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha"
    },
    sync_root_with_cwd = true,
})
