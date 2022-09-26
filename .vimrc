syntax enable

filetype plugin on
filetype indent on

set expandtab
set si

set wrap

set showcmd
set number

set wildmenu
set lazyredraw
set showmatch

set incsearch
set hlsearch

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set swapfile
set dir=/tmp

colorscheme iceberg

call plug#begin('~/.vim/plugged')
Plug 'cocopon/iceberg.vim'
call plug#end()

execute pathogen#infect()
autocmd vimenter * NERDTree

let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1

" Toggle auto formatting:
nnoremap <S-U> * :ClangFormat<cr>
autocmd FileType c,cpp ClangFormatAutoEnable

let g:yapf_style = "google"
nnoremap <S-C> * :Yapf<cr>
autocmd BufWritePre *.py 0,$!yapf

autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
