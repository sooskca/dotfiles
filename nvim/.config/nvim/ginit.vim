" vim: fdm=marker ts=2 sts=2 sw=2
" init.vim - My neovim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

if exists('GuiLoaded')
  GuiFont Iosevka:h12
else
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka 12')
endif

set guioptions= " disable all UI options

set guicursor+=a:blinkon0 " disable blinking cursor

autocmd GUIEnter * set novisualbell t_vb= " be silent
