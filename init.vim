
" disable vi compatibility
set nocompatible

" install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo "Installing vim-plug"
	" fetch vim-plug
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugin Install -----------------
"
call plug#begin('~/.config/nvim/plugged')

" if there are new plugins, automatically install them
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

" colourscheme
Plug 'tomasr/molokai'

" fuzzy file searcher
Plug 'kien/ctrlp.vim'

" vim-airline - statusbar and buffer bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" asynchronous linting engine - powers realtime code linting...
Plug 'w0rp/ale'

call plug#end()

syntax enable " enable syntax processing

" set colour scheme and background colour
colorscheme molokai
" this line must go *after* syntax enable...
highlight Normal ctermfg=grey ctermbg=236

" why would you ever hold shift????
map ; :

" Tab Settings -----------------
" number of visual spaces per tab
set tabstop=4
" number of spaces in a tab when editing - ie number of spaces inserted when
" you hit the <TAB> key
set softtabstop=4
" make <TAB> insert spaces
set expandtab

" UI Config -----------------
" show line number
set number
" by default use relative numbering
set relativenumber
" show command in the bottom bar
set showcmd
" highlight the current line
set cursorline
" load filetype specific indent files
filetype indent on
" visual autocomplete for command menu
set wildmenu
" stop random redrawing
set lazyredraw
" highlight matching [{()}]
set showmatch

" Searching -----------------
set incsearch " search as characters are highlighted
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Movement -----------------
" vertically by visual line
nnoremap j gj
nnoremap k gk

" sensible begin/end line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" Leader Shortcuts -----------------

" Map leader to ,
let mapleader=','

" reload initvim
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" buffer navigation
nnoremap <leader>m :bp<CR>
nnoremap <leader>w :bn<CR>
" close buffer
nnoremap <leader>t :bd<CR>

" CtrlP Configuration -----------------
" order of matched files bottom to top
let g:ctrlp_match_window = 'bottom,order:btt'  
" always open files in new bufffers
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0 " CtrlP respects working directory changes
" if Ag available, use it to perform searching of file names
if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
        echo 'Please install Ag to enable ctrlp ag searching'
endif

" Visual Mode -----------------------
"
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Vim Airline -----------------
let g:airline_theme = 'molokai'
" enable tabline
let g:airline#extensions#tabline#enabled = 1

" Linting Configuration -----------------
" Enable Linters
let g:ale_linters = {'python': ['black', 'flake8']}
" configure going to next and previous errors
nnoremap <space>l :lnext<CR>
nnoremap <space>p :lprevious<CR>
nnoremap <space>r :lrewind<CR>

" Custom Functions -----------------

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

