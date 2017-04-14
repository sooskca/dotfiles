" editing.vim - My neovim editing settings
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" Use global clipboard
if has('unnamedplus')
  set clipboard& clipboard=unnamedplus
else
  set clipboard& clipboard=unnamed
endif

let &shiftwidth=2 " Number of spaces when indenting

let &softtabstop=2 " Number of spaces per tab in insert mode

let &tabstop=2 " Number of spaces per tab for display

set expandtab " Spaces instead of tabs

set hidden " Hide buffers, not close them

set shiftround " Round indent to multiple of 'shiftwidth'

set virtualedit=block " Enable virtualedit in visual block mode

" Files to ignore while autocompleting
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
