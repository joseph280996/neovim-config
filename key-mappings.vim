"{{ Tabs management }}
"---> Tab friendly commands to start with <t+(n,o,c,m)>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>
" --->Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" {{ Split And Tabs }}
set splitbelow splitright
" ---> Remapping split navigation to Ctrl + <h,j,k,l>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" ---> Friendly Adjusting split size
nmap <silent> <c-left> :vert res -3<CR>
nmap <silent> <c-right> :vert res +3<CR>
nmap <silent> <c-up> :res +3<CR>
nmap <silent> <c-down> :res -3<CR>

