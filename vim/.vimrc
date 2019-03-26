" vim: fdm=marker ts=2 sts=2 sw=2
" vimrc- My vim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0
"
let mapleader="\<Space>" | let maplocalleader="\\"

let g:is_windows = has('win32') || has('win64')
let g:is_nvim = has('nvim')

if g:is_nvim
  let g:python3_host_prog='~/virtualenv/nvim3/Scripts/python.exe'
endif

" Setup
if !filereadable(expand("~/.vim/autoload/plug.vim"))
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  silent exec "!\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
else

  " Load Plugins
  source ~/.vim/plugins.vim

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


