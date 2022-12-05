local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

local packer_bootstrap = ensure_packer()

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Native LSP
    use 'williamboman/mason.nvim' -- Simple to use LSP installer
    use 'williamboman/mason-lspconfig.nvim' -- Simple to use LSP installer
    use "jose-elias-alvarez/null-ls.nvim"

    -- Code Completion
    use 'hrsh7th/nvim-cmp' -- Completion Plugin
    use 'hrsh7th/cmp-buffer' -- Buffer Completion
    use 'hrsh7th/cmp-path' -- Path Completion
    use 'hrsh7th/cmp-cmdline' -- CMD Completion
    use 'saadparwaiz1/cmp_luasnip' -- Snippet Completion
    use 'hrsh7th/cmp-nvim-lsp' -- Buffer Completion

    -- Development Utilities
    use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
    use 'numToStr/Comment.nvim' -- Easily comment stuff

    -- Lua Development
    use "nvim-lua/plenary.nvim"

    -- Snippets
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use 'rafamadriz/friendly-snippets' -- Snippets extension to use

    -- Tree
    use 'kyazdani42/nvim-tree.lua'

    -- Icon
    use 'kyazdani42/nvim-web-devicons'

    -- Statusline
    use 'christianchiarulli/lualine.nvim'
    use "akinsho/bufferline.nvim"

    -- Themes
    use 'cocopon/iceberg.vim'

    -- Start Screen
    use "goolord/alpha-nvim"

    -- Project
    use "ahmedkhalf/project.nvim"

    -- Session
    use "rmagatti/auto-session"
    use "rmagatti/session-lens"

    -- Fuzzy Finder/Telescope
    use {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.0',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }
    use "nvim-telescope/telescope-media-files.nvim"
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use "tom-anders/telescope-vim-bookmarks.nvim"

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Notification
    use "rcarriga/nvim-notify"

    -- Buffers Utilities
    use({ "ghillb/cybu.nvim", branch = "main", requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }})
    use "moll/vim-bbye"
    use "lewis6991/impatient.nvim"

    -- Git
    use 'sindrets/diffview.nvim'
    use 'tpope/vim-fugitive'

    -- Treesitter
    use { 
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Useful Utilities
    use 'folke/which-key.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
