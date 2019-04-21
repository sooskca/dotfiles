" vim: fdm=marker ts=2 sts=2 sw=2
" vim-plug.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Requirements  {{{
Plug 'roxma/nvim-yarp'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"}}}

" Editing {{{

  Plug 'kana/vim-textobj-user' "{{{
  Plug 'fvictorio/vim-textobj-backticks'
  Plug 'saaguero/vim-textobj-pastedtext'
  "}}}
  Plug 'junegunn/vim-easy-align'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'mbbill/undotree'

  Plug 'tpope/vim-abolish'
  Plug 'bfredl/nvim-miniyank'
  Plug 'moll/vim-bbye'
  Plug 'tpope/vim-repeat'
  Plug 'mtth/scratch.vim'
  Plug 'tpope/vim-surround'
  Plug 'thaerkh/vim-workspace'

  "" Completion {{{

    """ 'ncm2/ncm2' {{{
    Plug 'ncm2/ncm2'

    """ }}}

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

  "" Languages {{{

    """ HTML & CSS {{{
    Plug 'mattn/emmet-vim'
    " }}}

    """ PHP {{{
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    Plug 'phpactor/ncm2-phpactor'
    " }}}

    """ JavaScript {{{
    Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
    " }}}

    """ TypeScript {{{
    Plug 'HerringtonDarkholme/yats.vim'
    " }}}

    """ Godot {{{
    Plug 'calviken/vim-gdscript3'
    "}}}

    "" Libraries {{{
    Plug 'posva/vim-vue'
    "}}}

  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
  Plug 'sheerun/vim-polyglot'

  " }}}

  Plug 'sirver/UltiSnips' "{{{
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'honza/vim-snippets'
  "}}}

  Plug 'metakirby5/codi.vim'
  Plug 'tpope/vim-commentary'
  Plug 'raimondi/delimitmate'
  Plug 'ludovicchabant/vim-gutentags'

" }}}

" Interface {{{
  " Appearance {{{
  Plug 'chriskempson/base16-vim'
  Plug 'ryanoasis/vim-devicons'
  "}}}

  " Status Line "{{{

  Plug 'vim-airline/vim-airline' "{{{
  Plug 'vim-airline/vim-airline-themes'
  "}}}

  "}}}

  " File Navigation "{{{
  Plug 'wincent/ferret'
  Plug 'junegunn/fzf.vim'

  "Plug 'ctrlpvim/ctrlp.vim'"{{{
  "Plug 'tacahiroy/ctrlp-funky'
  "Plug 'sgur/ctrlp-extensions.vim'
  ""}}}

  Plug 'scrooloose/nerdtree' "{{{
  Plug 'Xuyuanp/nerdtree-git-plugin'
  "}}}

  Plug 'amiorin/vim-project'
  Plug 'farmergreg/vim-lastplace'
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
