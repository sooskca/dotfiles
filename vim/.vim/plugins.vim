" vim: fdm=marker ts=2 sts=2 sw=2
" plugins.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Editing {{{

  Plug 'tpope/vim-repeat'
  Plug 'mtth/scratch.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-abolish'
  Plug 'bfredl/nvim-miniyank'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'raimondi/delimitmate'
  Plug 'terryma/vim-expand-region'
  Plug 'junegunn/vim-easy-align'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'thaerkh/vim-workspace'
  Plug 'wellle/targets.vim'


  "" Completion {{{

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "" }}}

" }}}

" Programming {{{

  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-commentary'
  Plug 'mattn/emmet-vim'

  "" Source Control {{{
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'

    " }}}

  "" Code Quality {{{

    Plug 'neomake/neomake'
    Plug 'sbdchd/neoformat'
    Plug 'janko-m/vim-test'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-dispatch'

  " }}}

  "" Languages {{{

    """ JavaScript {{{
      Plug 'othree/yajs.vim', {'for': 'javascript'}
    """ }}}

    """ PHP {{{

      Plug 'StanAngeloff/php.vim'
      Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
      Plug 'camilledejoye/phpactor-mappings'
      Plug 'shawncplus/phpcomplete.vim'
      Plug '2072/PHP-Indenting-for-VIm'
      Plug 'tobyS/pdv'
      Plug 'tobyS/vmustache'

      " }}}

    """ Markdown {{{
      Plug 'godlygeek/tabular'
      Plug 'plasticboy/vim-markdown'
    """ }}}

    Plug 'sheerun/vim-polyglot'

    " }}}
" }}}

" Interface {{{

  Plug 'moll/vim-bbye'
  Plug 'mbbill/undotree'

  "" Appearance {{{

    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

  " }}}

  "" Navigation {{{

    Plug 'farmergreg/vim-lastplace'

    Plug 'majutsushi/tagbar'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    "" }}}

"" Motion {{{

  Plug 'easymotion/vim-easymotion'
  Plug 'vim-scripts/matchit.zip'
  Plug 'justinmk/vim-sneak'

"" }}}

"" Highlighting {{{

  Plug 'psychollama/further.vim'
  Plug 'yggdroot/indentline'
  Plug 'vasconcelloslf/vim-interestingwords'
  Plug 'xtal8/traces.vim'

"" }}}

" }}}

" Utilities {{{

  Plug 'konfekt/fastfold'
  Plug 'octref/rootignore'
  Plug 'tpope/vim-unimpaired'

  Plug 'mhinz/vim-startify'

  "}}}

call plug#end()
