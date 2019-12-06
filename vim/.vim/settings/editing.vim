" editing.vim - My vim editing settings
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

" visual mode
set virtualedit=block " enable virtualedit in visual block mode
set nostartofline " keep cursor in original column

" match brackets
set showmatch " briefly jump to matching bracket on inserting one
set matchtime=3 " wait before highlighting bracket

" buffers
set autoread " load outside changes
set hidden " hide buffers, not close them
set switchbuf=useopen " use existing buffers

" use global clipboard
if has('unnamedplus')
  set clipboard& clipboard=unnamedplus
else
  set clipboard& clipboard=unnamed
endif

" indentation
let &shiftwidth=2 " number of spaces when indenting
let &softtabstop=2 " number of spaces per tab in insert mode
let &tabstop=2 " number of spaces per tab for display
set expandtab " spaces instead of tabs
set smarttab " indent using spaces
set breakindent " preserve horizontal blocks of text
set autoindent " maintain indentation
set shiftround " round indent to multiple of 'shiftwidth'

" files to ignore while autocompleting
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,node_modules\**,*.min.js,dist\**
else
  set wildignore+=*/.git/*,*/node_modules/**,*.min.js,*/dist/**

endif

" undo & swap
set noswapfile " avoid creating a swapfile
set backup " enable backups
set undofile " persistent undo history
set history=1000 " increase the undo limit

" undo & backup directories
set backupdir=~/.vim/backup undodir=~/.vim/undo
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif
