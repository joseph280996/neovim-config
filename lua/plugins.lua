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

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP and Code Completion
  use {'neoclide/coc.nvim', branch = 'release'}
  
  -- Lua Development
  use "nvim-lua/plenary.nvim"

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
  --  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Notification
  use "rcarriga/nvim-notify"

  -- Buffers Utilities
  use({ "ghillb/cybu.nvim", branch = "main", requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }})
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"

  -- Git
  use 'sindrets/diffview.nvim'
  use 'tpope/vim-fugitive'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
