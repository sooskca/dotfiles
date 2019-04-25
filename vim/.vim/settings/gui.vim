" vim: fdm=marker ts=2 sts=2 sw=2
" init.vim - My neovim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

if exists('GuiLoaded')
  GuiFont! Iosevka:h12
elseif exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka 12')
elseif exists('veonim')
  Plug 'sheerun/vim-polyglot'
  Plug 'ElmCast/elm-vim'

  set guifont=Iosevka:h16
  set linespace=10
  " extensions for web dev
  let g:vscode_extensions = [
        \'sbrink.elm',
        \'vscode.typescript-language-features',
        \'vscode.css-language-features',
        \'vscode.html-language-features',
        \]

  " multiple nvim instances
  nno <silent> <c-t>c :Veonim vim-create<cr>
  nno <silent> <c-g> :Veonim vim-switch<cr>
  nno <silent> <c-t>, :Veonim vim-rename<cr>

  " workspace functions
  nno <silent> ,f :Veonim files<cr>
  nno <silent> ,e :Veonim explorer<cr>
  nno <silent> ,b :Veonim buffers<cr>
  nno <silent> ,d :Veonim change-dir<cr>
  "or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

  " searching text
  nno <silent> <space>fw :Veonim grep-word<cr>
  vno <silent> <space>fw :Veonim grep-selection<cr>
  nno <silent> <space>fa :Veonim grep<cr>
  nno <silent> <space>ff :Veonim grep-resume<cr>
  nno <silent> <space>fb :Veonim buffer-search<cr>

  " language features
  nno <silent> sr :Veonim rename<cr>
  nno <silent> sd :Veonim definition<cr>
  nno <silent> si :Veonim implementation<cr>
  nno <silent> st :Veonim type-definition<cr>
  nno <silent> sf :Veonim references<cr>
  nno <silent> sh :Veonim hover<cr>
  nno <silent> sl :Veonim symbols<cr>
  nno <silent> so :Veonim workspace-symbols<cr>
  nno <silent> sq :Veonim code-action<cr>
  nno <silent> sk :Veonim highlight<cr>
  nno <silent> sK :Veonim highlight-clear<cr>
  nno <silent> ,n :Veonim next-usage<cr>
  nno <silent> ,p :Veonim prev-usage<cr>
  nno <silent> sp :Veonim show-problem<cr>
  nno <silent> <c-n> :Veonim next-problem<cr>
  nno <silent> <c-p> :Veonim prev-problem<cr>

endif

set guioptions= " disable all UI options

set guicursor+=a:blinkon0 " disable blinking cursor

autocmd GUIEnter * set novisualbell t_vb= " be silent
