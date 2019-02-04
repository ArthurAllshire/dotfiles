
" disable vi compatibility
set nocompatible

" install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	" fetch vim-plug
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" if there are new plugins, automatically install them
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

" colourscheme
Plug 'tomasr/molokai'

call plug#end()

syntax enable " enable syntax processing

" set colour scheme and background colour
colorscheme molokai
" this line must go *after* syntax enable...
highlight Normal ctermfg=grey ctermbg=236

