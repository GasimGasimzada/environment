if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim/plugins')

call dein#add('Shougo/dein.vim')
call dein#add('trusktr/seti.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#end()

filetype plugin indent on

set number
syntax on
colorscheme seti
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

highlight NonText ctermbg=16
