" vim: fdm=marker ts=2 sts=2 sw=2
" init.vim - My neovim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

" Variables {{{

if has("user_commands")
  let mapleader = ','
  let g:mapleader = ','
  let g:maplocalleader = 'm'
endif

let s:is_windows = has('win32') || has('win64')
let s:is_nvim = has('nvim')

let g:python3_host_prog='C:/Users/Jackson/virtualenv/nvim3/Scripts/python.exe'
let g:python_host_prog='C:/Users/Jackson/virtualenv/nvim/Scripts/python.exe'

" }}}


" Setup {{{
set nocompatible              " be iMproved, required
filetype off                  " required

if s:is_windows
	set rtp+=~/.vim
endif

set noswapfile " avoid creating a swapfile
set backup " Enablbe backups
set undofile

set backupdir=~/.vim/backup
set undodir=~/.vim/undo
if !isdirectory(&backupdir)
	call mkdir(&backupdir, "p")
endif
if !isdirectory(&undodir)
	call mkdir(&undodir, "p")
endif

" }}}


" Plugins {{{

" Setup {{{

if !filereadable(expand("~/.vim/autoload/plug.vim"))
	echo "Installing vim-plug and plugins. Restart vim after finishing the process."
	silent call mkdir(expand("~/.vim/autoload", 1), 'p')
	execute "!curl -fLo ".expand("~/.vim/autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall
endif

" Initialize
call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'https://github.com/%s.git'

" }}}

" Load & Configure {{{

" Editing {{{

Plug 'raimondi/delimitmate' "{{{
let delimitMate_expand_cr = 1
" }}}
Plug 'junegunn/vim-easy-align' "{{{
" Align everything, since by default it doesn't align inside a comment
let g:easy_align_ignore_groups = []
let g:easy_align_delimiters = {
      \ ';': { 'pattern': ';', 'left_margin': 0, 'stick_to_left': 1 } }
xmap gl <Plug>(LiveEasyAlign)
nmap gl <Plug>(LiveEasyAlign)
" }}}
Plug 'terryma/vim-multiple-cursors' "{{{
let g:multi_cursor_exit_from_insert_mode = 0
" }}}
Plug 'lifepillar/vim-mucomplete' "{{{
set completeopt-=preview
set completeopt+=longest,menuone,noselect
" inoremap <silent> <plug>(MUcompleteFwdKey) <right>
" imap <right> <plug>(MUcompleteCycFwd)
" inoremap <silent> <plug>(MUcompleteBwdKey) <left>
" imap <left> <plug>(MUcompleteCycBwd)
" }}}
Plug 'sbdchd/neoformat' "{{{
nnoremap <leader>f :Neoformat<cr>
xnoremap <leader>f :Neoformat<cr>
" }}}
Plug 'kana/vim-textobj-user' "{{{

Plug 'fvictorio/vim-textobj-backticks'
Plug 'saaguero/vim-textobj-pastedtext'

" }}}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" }}}

" Interface {{{

Plug 'w0rp/ale' "{{{
let g:ale_linters = {'spec': ['rpmlint']}
" }}}
Plug 'kien/ctrlp.vim' "{{{

Plug 'tacahiroy/ctrlp-funky'

let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_max_height=40
let g:ctrlp_show_hidden=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=20000
let g:ctrlp_reuse_window='startify'
let g:ctrlp_extensions=['funky']
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git|hg|svn|idea)$',
      \ 'file': '\v\.DS_Store$'
      \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

if executable('pt')
  let g:ctrlp_user_command='pt --nocolor -g '\\*' %s'
endif


nmap \ [ctrlp]
nnoremap [ctrlp] <nop>
nnoremap [ctrlp]t :CtrlPBufTag<cr>
nnoremap [ctrlp]T :CtrlPTag<cr>
nnoremap [ctrlp]l :CtrlPLine<cr>
nnoremap [ctrlp]o :CtrlPFunky<cr>
nnoremap [ctrlp]b :CtrlPBuffer<cr>

let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_matchtype = 'path'

" }}}

Plug 'tpope/vim-fugitive'
Plug 'psychollama/further.vim'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'xtal8/traces.vim'

" }}}

" Programmin {{{
" }}}

" Performance & Compatibility {{{

if !has('patch-8.0.1238')
  " If you're using an old Vim without incsearch, replace it with:
  Plug 'haya14busa/incsearch.vim' "{{{
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  " }}}
endif

Plug 'konfekt/fastfold'
Plug 'editorconfig/editorconfig-vim'

" }}}

" Utilities {{{
"
" " Utilities {{{
" }}}
" }}}

" Keybindings {{{

Plug 'tpope/vim-unimpaired' "{{{
" custom unimpaired-like mappings
nnoremap coa :ALEToggle<cr>
nnoremap cog :GitGutterToggle<cr>

" }}}

" }}}

Plug 'vim-scripts/matchit.zip'

Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{

Plug 'Xuyuanp/nerdtree-git-plugin'

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=0
let NERDTreeIgnore=['\.git','\.hg']

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>

let g:NERDTreeWinSize=40

" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1

" Single-click to toggle directory nodes, double-click to open non-directory
" nodes.
let g:NERDTreeMouseMode=2

if has('autocmd')
  augroup settings-plugin-nerdtree
    autocmd!

    " Shows at startup (if a directory is opened)
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    " Tries to select last file
    autocmd User NERDTreeInit call SelectLastFile()

    " Exits when is the only window shown
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
endif

" }}}
Plug 'sjl/badwolf'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'Valloric/ListToggle' "{{{
let g:lt_location_list_toggle_map = '<leader>Q'
let g:lt_quickfix_list_toggle_map = '<leader>q'
" }}}
Plug 'AndrewRadev/linediff.vim' "{{{
autocmd User LinediffBufferReady nnoremap <buffer> q :LinediffReset<cr>
autocmd User LinediffBufferReady setlocal nocursorline
nnoremap <leader>d :Linediff<cr>
xnoremap <leader>d :Linediff<cr>
" }}}
Plug 'christoomey/vim-tmux-navigator' "{{{
let g:tmux_navigator_save_on_switch = 1
" }}}

Plug 'sheerun/vim-polyglot'
"
if exists('g:gui_oni')

else
  Plug 'itchyny/lightline.vim' "{{{
  set noshowmode
endif

Plug 'yggdroot/indentline' "{{{
let g:indentLine_char = '⎸'
" }}}"

call plug#end()

" }}}


" }}}

" Settings {{{


" Base {{{

set helpheight=30 " Minimum height of a new help window

set lazyredraw " Don't redraw while executing macros

set timeout timeoutlen=3000 ttimeoutlen=100 " Timeout

set modeline " Enable modeline

" }}}

" Editing {{{

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
" }}}

" Interface {{{

if exists("g:GuiLoaded") " we have a gui
  GuiFont Consolas:13

	set guioptions= " disable all UI options

	set guicursor+=a:blinkon0 " disable blinking cursor

	autocmd GUIEnter * set novisualbell t_vb=

else " we are in the terminal
  set noerrorbells novisualbell t_vb= " be silent about it

  if !s:is_nvim " we are boring
    set term=xterm
  endif

  set t_ut= " setting for looking properly in tmux

  set t_BE= " disable bracketed-paste mode

  let &t_Co = 256 " terminal colors

  if s:is_windows " support 256 colors and scroll in conemu
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
    inoremap <esc>[62~ <c-x><c-e>
    inoremap <esc>[63~ <c-x><c-y>
    nnoremap <esc>[62~ 3<c-e>
    nnoremap <esc>[63~ 3<c-y>
  endif
endif

colorscheme badwolf

set colorcolumn=80 " display a line in column 80 to show you where to line break

set cursorline " highlight the screen line of the cursor

set foldcolumn=1 " width of the column used to indicate folds

set foldenable " set to display all folds open

set foldlevelstart=1 " start folded

set foldnestmax=10 " avoid excessive nesting

set foldmethod=indent " how to fold

set ignorecase " ignore case in search patterns

set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:% " Show whitespace characters

set matchpairs+=<:> " highlight <>.

set matchtime=3 " highlight when moving the cursor

set mouse=a " enable the use of mouse clicks

set nowrap " do not wrap long lines

set number " show line numbers in gutter

set relativenumber " Show relative numbers in gutter

set scrolloff=7 " minimum number of lines above and below cursor

set showmatch " briefly jump to matching bracket on inserting one

set smartcase " no ignore case when pattern has uppercase

set visualbell t_vb= " disable visualbell

set wildmode=list:longest,full " turn on the WiLd menu

set wrapscan " searches wrap around the end of the file

" }}}


" }}}

" Keybindings {{{


" Command {{{

" W - Saves the file using sudo
cabbrev w!! w !sudo tee "%"

" <C-a/e> - Go to the beginning and end of line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" <C-p/n> - Filter command history the same way as <Up> <Down> do
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" }}}

" Insert {{{

" jj - Exits insert modeejj
imap jk <Esc>

" <C-a/e> Go to the beginning and end of line
inoremap <C-a> <Home>
inoremap <C-e> <End>

" }}}

" Normal {{{
" 0 -- Go to first non-blank character
map 0 ^

" - -- Like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>

" j|k -- Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Space -- Toggle folds
nnoremap <space> za

" Esc -- Clears the highlighting from the previous search
nnoremap <esc> :noh<return><esc>

" B|E -- Move to beginning and end of line
nnoremap B ^
nnoremap E $

" Q -- Closes the window
nnoremap Q :q<cr>

" Tab|S-Tab -- Navigate tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" C-j|k|l|h -- Navigate windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" S-t -- Create new tabs
nnoremap <silent> <S-t> :tabnew<CR>

" <Leader><o> -- Open last buffer.
nnoremap <Leader>o <C-^>

" <Leader>w -- Save the file
nmap <Leader>w :w!<cr>

" <Leader>c -- Close buffer
noremap <Leader>c :bd<CR>

" <Leader>ev|ez|sv -- Edits vimrc, zshrc and source vimrc
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" <Leader>h|v -- Split window horizontally and vertically
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" <Leader>. -- Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" <Leader>e -- Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" <Leader>p -- Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" <Leader>r -- Cycle though relative line number + number, number (only), and
" no numbers.
nnoremap <silent> <Leader>r :call CycleLineNumbers()<CR>

" <Leader> x - Replace every match in the quickfix list
nnoremap <leader>x :cdo s/<C-r>///g \| update<left><left><left><left><left><left><left><left><left><left><left>

" }}}

" Visual {{{
" Q - Execute macro over visual selection
xnoremap Q :'<,'>:normal @q<cr>

" Visual paste without losing the copied content
xnoremap p "0p
" }}}

" Terminal {{{

" Easy navigation
if has('terminal') || s:is_nvim
	tnoremap <esc><esc> <C-\><C-n>
	tnoremap <PageUp> <C-W>N<C-U>
endif

" }}}

" }}}

" Utilities {{{


" Functions {{{

function! CycleLineNumbers()
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

" }}}

" Commands {{{

augroup user-utilities
	autocmd!
	" Open the file placing the cursor where it was
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif

	" Close preview window when leaving insert mode http://stackoverflow.com/a/3107159/854676
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif

	" Automatically equalize splits when Vim is resized
	autocmd VimResized * wincmd =
augroup END

" }}}


" }}}

" }}}


" Source private vimrc file if available
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
