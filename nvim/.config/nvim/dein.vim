set runtimepath+=.cache/dein/repos/github.com/Shougo/dein.vim

" Startup
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage itself
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Load plugins

  " Required: Commit
  call dein#end()
  call dein#save_state()
endif

" Install uninstalled plugins on startup.
if dein#check_install()
  call dein#install()
endif
