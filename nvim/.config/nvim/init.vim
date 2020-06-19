" vim: fdm=marker ts=2 sts=2 sw=2
" init.vim - My neovim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

set runtimepath+=~/.vim,~/.vim/after

let &packpath=&runtimepath

let g:is_windows = has('win32') || has('win64')
if !g:is_windows
  set shell=/usr/bin/zsh
endif

set ffs=unix,dos

source ~/.vimrc
