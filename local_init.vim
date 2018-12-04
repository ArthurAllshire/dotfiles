" buffer movement commands
noremap <leader>m :bp<CR>
noremap <leader>w :bn<CR>

" check files on opening
let g:syntastic_check_on_open = 1

" map ; to :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

