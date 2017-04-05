" bindings/command.vim - My command mode bindings for neovim
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" W - Saves the file using sudo
command! W w !sudo tee % > /dev/null
