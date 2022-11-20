" {{ Startify Config }}

" Session Location
let g:startify_session_dir = '~/.config/nvim/session'                               

" Custom Header Art 
let g:startify_custom_header =
            \ startify#pad(split(system('figlet -f 3D-ASCII -w 100 NEOVIM'), '\n'))

" Specify What to Display
let g:startify_lists = [
            \ { 'type': 'files',        'header': ['    Files']                         },
            \ { 'type': 'dir',          'header': ['    Current Directory '. getcwd()]  },
            \ { 'type': 'session',      'header': ['    Sessions']                      },
            \ { 'type': 'bookmarks',    'header': ['    Bookmarks']                     },
            \]

" Bookmarks
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \]

" Settings enabling
let g:startify_change_to_vcs_root = 1
let g:statify_session_persistence = 1
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
