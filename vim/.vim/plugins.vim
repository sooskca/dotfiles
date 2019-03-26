" vim: fdm=marker ts=2 sts=2 sw=2
" vim-plug.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Editing {{{
Plug 'kana/vim-textobj-user' "{{{
Plug 'fvictorio/vim-textobj-backticks'
Plug 'saaguero/vim-textobj-pastedtext'
"}}}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'thaerkh/vim-workspace'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'lifepillar/vim-mucomplete'
" }}}

" Programming {{{

"" Source Control {{{
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'mhinz/vim-signify'
" }}}
"" Code Quality {{{
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'sbdchd/neoformat'
" }}}
"" Languages {{{
Plug 'sheerun/vim-polyglot'
" }}}
""" JavaScript {{{
"Plug 'posva/vim-vue'
"}}}

Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'shougo/neosnippet-snippets'
Plug 'shougo/neosnippet.vim'
" }}}

" Interface {{{
" Appearance {{{
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
"}}}
" Status Line "{{{
Plug 'vim-airline/vim-airline' "{{{
Plug 'vim-airline/vim-airline-themes'
"}}}
if !g:is_windows
  Plug 'edkolev/tmuxline.vim'
endif
"}}}
" File Navigation "{{{
Plug 'ctrlpvim/ctrlp.vim'"{{{
Plug 'tacahiroy/ctrlp-funky'
Plug 'sgur/ctrlp-extensions.vim'
"}}}
Plug 'scrooloose/nerdtree' "{{{
Plug 'Xuyuanp/nerdtree-git-plugin'
"}}}
"}}}

Plug 'psychollama/further.vim'

" Motion {{{
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
"}}}
" Highlighting {{{
Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'xtal8/traces.vim'
"}}}

" }}}

" Utilities {{{
Plug 'octref/rootignore'
Plug 'mhinz/vim-startify'
Plug 'Valloric/ListToggle'
Plug 'christoomey/vim-tmux-navigator'
Plug 'konfekt/fastfold'
Plug 'tpope/vim-unimpaired'

" }}}

call plug#end()

