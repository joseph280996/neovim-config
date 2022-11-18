call plug#begin()
  Plug 'leafgarland/typescript-vim'
  "{{ List Recent Projects On Open }}
  Plug 'mhinz/vim-startify'

  "{{ File Tree}}
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  "{{ Fuzzy Finder }}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim',
  Plug 'airblade/vim-rooter',     "Use to detect work space

  "{{ Code completion }}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "{{ Buffer Packages }}
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
  Plug 'moll/vim-bbye',

  " {{ Code snippets }}
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " {{ Themes }}
  "Plug 'cocopon/iceberg.vim'
  "Plug 'casonadams/nord.vim'
  Plug 'stillwwater/vim-nebula'
  "Plug 'EdenEast/nightfox.nvim'
  Plug 'ryanoasis/vim-devicons'         "Files icons
  Plug 'nvim-tree/nvim-web-devicons'     "Files icons specific to Neovim

  "{{ Airline }}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


  "{{ Git integration }}
  Plug 'tpope/vim-fugitive'             "Git commands within vim
  "Plug 'airblade/vim-gitgutter'         "Git changes on the gutter
  Plug 'Xuyuanp/nerdtree-git-plugin'    "Nerdtree git changes

  "{{ Markdown preview }}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'}   "Require node.js and yarn installed

call plug#end()
