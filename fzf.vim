"{{ FZF Configuring }}
nmap <c-P> :FZF
nmap <c-f> :Files<CR>
nmap <leader>f :Rg
"Tell FZF to ignore files in node_modules and .git
let g:fzf_tags_command = 'ctags -R'

" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

