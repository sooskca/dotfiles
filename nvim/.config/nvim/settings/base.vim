"" base.vim - My essential neovim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1
"

let $VIMUSERRUNTIME = fnamemodify($MYVIMRC, ':p:h')

set helpheight=30 " Minimum height of a new help window

set lazyredraw " Don't redraw while executing macros

set timeout timeoutlen=3000 ttimeoutlen=100 " Timeout

set modeline " Enable modeline

" Set leader key
if has("user_commands")
  let mapleader = ','
  let g:mapleader = ','
  let g:maplocalleader = 'm'
endif
