" vim: fdm=marker ts=2 sts=2 sw=2
" vimrc- My vim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0
"
let mapleader="\<Space>" | let maplocalleader="\\"

let g:is_windows = has('win32') || has('win64')
let g:is_nvim = has('nvim')

" Setup
" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Global Settings
source ~/.vim/settings/base.vim
source ~/.vim/settings/plugins.vim
source ~/.vim/settings/editing.vim
source ~/.vim/settings/interface.vim
source ~/.vim/settings/keybindings.vim
source ~/.vim/settings/commands.vim

" Local Settings
if filereadable('~/.vim/local.vim')
  source ~/.vim/local.vim
endif
