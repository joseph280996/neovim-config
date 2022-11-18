" {{ Airline Configuring }}

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='bubblegum'

" {{ Startify Config }}
 let g:startify_custom_header =
       \ startify#pad(split(system('figlet -f 3D-ASCII -w 100 NEOVIM'), '\n'))

