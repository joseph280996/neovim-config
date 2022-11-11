"{{ Configuring NerdTree }}
let NERDTreeChDirMode=2
let NERDTreeIgnore = [ '__pycache__', '\.pyc$', '\.o$', '\.swp',  '*\.swp',  'node_modules/' ] "to hide unwanted files
let NERDTreeShowHidden=1                                                                       "show hidden files
" ---> Toggling nerd-tree using Ctrl-N <---
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
