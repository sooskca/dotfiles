" vim: fdm=marker ts=2 sts=2 sw=2
" init.vim - My neovim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

if exists('g:fvim_loaded')
  source ~/.vim/settings/fvim.vim
endif

if exists('GuiLoaded')
  GuiFont! Iosevka NF:h12
else
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka 12')
endif

set guifont=Iosevka\ NF:h14

set guioptions= " disable all UI options

set guicursor+=a:blinkon0 " disable blinking cursor

autocmd GUIEnter * set novisualbell t_vb= " be silent


