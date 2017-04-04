" ui.vim - My user interface configuration for neovim
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" TODO: improve base16-shell integration
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  let base16colorspace=256
  colorscheme=base16-default-dark
endif

set colorcolumn=80 " Display a line in column 80 to show you where to line break

set cursorline " Highlight the screen line of the cursor

set foldcolumn=1 " Width of the column used to indicate folds

set foldenable " Set to display all folds open

set foldlevel=10 " Start unfolded

set foldmethod=indent " Folding type

set ignorecase " Ignore case in search patterns

set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:% " Show whitespace characters

set matchpairs+=<:> " Highlight <>.

set matchtime=3 " Highlight when moving the cursor

set mouse=a " Enable the use of mouse clicks

set nowrap " Do not wrap long lines

set number " TODO: setup relative line numbers

set scrolloff=7 " Minimum number of lines above and below cursor

set showmatch " Briefly jump to matching bracket on inserting one

set smartcase " No ignore case when pattern has uppercase

set visualbell t_vb= " Disable visualbell

set wildmode=list:longest,full " Turn on the WiLd menu

set wrapscan " Searches wrap around the end of the file
