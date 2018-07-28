" ui.vim - My user interface configuration for vim
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

set shortmess+=I " hide the intro

set mouse=a " enable the use of mouse clicks

set splitright splitbelow " controls how panes are splits

set nowrap " do not wrap long lines

set nonumber " hide line numbers in gutter

set scrolloff=7 " minimum number of lines above and below cursor

" colors
set background=dark
colorscheme onedark

" show whitespace
set list listchars=tab:>-,nbsp:.,trail:.,extends:>,precedes:<
let &showbreak = '^'

" auto-completion
set wildmenu wildignorecase wildmode=list:longest,full
set complete-=i completeopt=menu
set tags=./tags,tags;

" highlighting
set colorcolumn=80 " display a line in column 80 to show you where to line break
set cursorline " highlight the screen line of the cursor
set matchpairs+=<:> " highlight <>.

" folding
set foldmethod=syntax " how to fold
set foldlevelstart=99 " start unfolded
set foldnestmax=10 " avoid excessive nesting

" search
set incsearch hlsearch " highlight searches
set ignorecase " ignore case in search patterns
set smartcase " no ignore case when pattern has uppercase
set wrapscan " searches wrap around the end of the file

" status line
set statusline=%-4m%f\ %y\ \ %=%{&ff}\ \|\ %{&fenc}\ [%l:%c]
set laststatus=2 " extended statusline
set showmode showcmd " displays active mode and typed commands
set modeline " enable modeline
set display+=lastline " always  show a paragraph’s last line.

" gui/terminal
if has('gui_running') || exists('GuiLoaded') " we have a gui
  if g:is_nvim
    GuiFont! Iosevka:h12
  else
    set guifont=Iosevka:h12
  endif

  set guioptions= " disable all UI options
  set guicursor+=a:blinkon0 " disable blinking cursor
  autocmd GUIEnter * set novisualbell t_vb=
else " we are in the terminal
  set noerrorbells novisualbell t_vb= " be silent
  if !g:is_nvim
    set term=xterm
  endif
  set t_ut= " look properly in tmux
  set t_BE= " disable bracketed-paste mode
  let &t_Co = 256 " terminal colors
  set termguicolors

  if g:is_windows " support 256 colors and scroll in conemu
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
    inoremap <esc>[62~ <c-x><c-e>
    inoremap <esc>[63~ <c-x><c-y>
    nnoremap <esc>[62~ 3<c-e>
    nnoremap <esc>[63~ 3<c-y>
  endif
endif

