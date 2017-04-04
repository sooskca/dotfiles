" plug.vim - My vim-plug configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" Install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize
call plug#begin('~/.local/share/nvim/plugged')

" Before
runtime! settings/plugins/**/*.plug.before

" Load
runtime! settings/plugins/**/*.plug

" After
runtime! settings/plugins/**/*.plug.after

" Commit
call plug#end()
