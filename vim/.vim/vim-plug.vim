" vim: fdm=marker ts=2 sts=2 sw=2
" vim-plug.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Editing {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'thaerkh/vim-workspace'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'lifepillar/vim-mucomplete'
Plug 'kana/vim-textobj-user'
Plug 'fvictorio/vim-textobj-backticks'
Plug 'saaguero/vim-textobj-pastedtext'
" }}}

" Programming {{{
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
Plug 'justinj/vim-react-snippets'
Plug 'janko-m/vim-test'
Plug 'raimondi/delimitmate'
Plug 'AndrewRadev/linediff.vim'
Plug 'sbdchd/neoformat'
" }}}

" Interface {{{

" Appearance
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" File Navigation
Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tacahiroy/ctrlp-funky'
  Plug 'sgur/ctrlp-extensions.vim'

Plug 'psychollama/further.vim'

Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'

" Highlighting
Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'xtal8/traces.vim'


" }}}

" Utilities {{{
Plug 'Valloric/ListToggle'
Plug 'christoomey/vim-tmux-navigator'
Plug 'konfekt/fastfold'
Plug 'tpope/vim-unimpaired'
" }}}

call plug#end()

