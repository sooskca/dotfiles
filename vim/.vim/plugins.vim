" vim: fdm=marker ts=2 sts=2 sw=2
" vim-plug.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Requirements  {{{
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'roxma/nvim-yarp'
"Plug 'prabirshrestha/async.vim'
"}}}

" Editing {{{

  Plug 'kana/vim-textobj-user' "{{{
  Plug 'fvictorio/vim-textobj-backticks'
  Plug 'saaguero/vim-textobj-pastedtext'
  "}}}
  Plug 'junegunn/vim-easy-align'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-repeat'
  Plug 'mtth/scratch.vim'
  Plug 'tpope/vim-surround'
  Plug 'thaerkh/vim-workspace'

  "" Completion {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
    """" 'ncm2/lsp' {{{
    "Plug 'prabirshrestha/vim-lsp'
    "Plug 'ncm2/ncm2-vim-lsp'
    "Plug 'ncm2/ncm2'
    "Plug 'ncm2/ncm2-neosnippet'
    "Plug 'phpactor/ncm2-phpactor'
    """"}}}
    """ 'Shougo/deoplete.nvim' {{{
    " if has('nvim')
    "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    " endif

    " Plug 'carlitux/deoplete-ternjs'
    """}}}
  "" }}}

" }}}

" Programming {{{

  "" Source Control {{{
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'AndrewRadev/linediff.vim'
  Plug 'mhinz/vim-signify'
  " }}}

  "" Code Quality {{{
  Plug 'editorconfig/editorconfig-vim'
  Plug 'w0rp/ale'
  Plug 'janko-m/vim-test'
  Plug 'tpope/vim-dispatch'
  " }}}

  "" Libraries {{{
  Plug 'posva/vim-vue'
  "}}}

  "" Languages {{{

    """ HTML & CSS {{{
    Plug 'mattn/emmet-vim'
    " }}}

    """ JavaScript/TypeScript {{{
    Plug 'HerringtonDarkholme/yats.vim'
    " Plug 'Quramy/tsuquyomi-vue'
    " Plug 'Quramy/tsuquyomi'
    " Plug 'ternjs/tern_for_vim'
    Plug 'rkathey/mtgvim'

    " }}}


    """ Godot {{{
    Plug 'calviken/vim-gdscript3'
    "}}}

    """ PHP {{{
    " Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
    " Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    " Plug '2072/PHP-Indenting-for-VIm'
    " Plug 'StanAngeloff/php.vim'
    "}}}

  Plug 'sheerun/vim-polyglot'

  " }}}

  Plug 'metakirby5/codi.vim'
  Plug 'tpope/vim-commentary'
  Plug 'raimondi/delimitmate'

" }}}

" Interface {{{
  " Appearance {{{
  Plug 'chriskempson/base16-vim'
  " Plug 'flazz/vim-colorschemes'
  " Plug 'connorholyday/vim-snazzy'
  Plug 'ryanoasis/vim-devicons'
  "}}}

  " Status Line "{{{
  " Plug 'itchyny/lightline.vim'

  Plug 'vim-airline/vim-airline' "{{{
  Plug 'vim-airline/vim-airline-themes'
  "}}}

  "}}}

  " File Navigation "{{{
  Plug 'ctrlpvim/ctrlp.vim'"{{{
  Plug 'tacahiroy/ctrlp-funky'
  Plug 'sgur/ctrlp-extensions.vim'
  "}}}
  Plug 'farmergreg/vim-lastplace'
  Plug 'scrooloose/nerdtree' "{{{
  Plug 'Xuyuanp/nerdtree-git-plugin'
  "}}}
"}}}

" Motion {{{
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
"}}}

" Highlighting {{{
Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'xtal8/traces.vim'
"}}}

Plug 'psychollama/further.vim'

" }}}

" Utilities {{{

  Plug 'octref/rootignore'
  Plug 'mhinz/vim-startify'
  Plug 'Valloric/ListToggle'
  Plug 'wellle/tmux-complete.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'konfekt/fastfold'
  Plug 'tpope/vim-unimpaired'

" }}}

call plug#end()
