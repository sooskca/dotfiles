"" base.vim - My essential vim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1
"

set nocompatible " be iMproved

set encoding=utf-8 " unicode

set lazyredraw " don't redraw while executing macros

set timeout timeoutlen=3000 ttimeoutlen=100 " key code delay

set backspace=indent,eol,start " sane backspace behaviour

set synmaxcol=400 " maximum column to search for syntax items

set helpheight=30 " minimum height of help window

" show signcolumn if supported
if has('patch-7.4.2201') | set signcolumn=yes | endif

filetype plugin indent on
syntax on

