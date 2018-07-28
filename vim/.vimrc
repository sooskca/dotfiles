" vim: fdm=marker ts=2 sts=2 sw=2
" vimrc- My vim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0
"
let mapleader="\<Space>" | let maplocalleader="\\"

let g:is_windows = has('win32') || has('win64')
let g:is_nvim = has('nvim')

if g:is_windows
  set rtp+=~/.vim
endif

if g:is_nvim
  let g:python3_host_prog='~/virtualenv/nvim3/Scripts/python.exe'
endif

" Setup
if !filereadable(expand("~/.vim/autoload/plug.vim"))
  echo "Installing vim-plug and plugins. Restart vim after finishing the process."
  silent call mkdir(expand("~/.vim/autoload", 1), 'p')
  execute "!curl -fLo ".expand("~/.vim/autoload/plug.vim", 1)." https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
else

  " Load Plugins
  if !exists('g:GtkGuiLoaded')
    source ~/.vim/vim-plug.vim
  endif

  " Global Settings
  source ~/.vim/settings/base.vim
  source ~/.vim/settings/editing.vim
  source ~/.vim/settings/interface.vim
  source ~/.vim/settings/keybindings.vim
  source ~/.vim/settings/plugins.vim
  source ~/.vim/settings/commands.vim

  " Local Settings
  if filereadable('~/.vim/local.vim')
    source ~/.vim/local.vim
  endif

endif


