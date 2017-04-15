" init.vim - My modular neovim configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

cd $HOME/Code

" Plugins
if filereadable(expand('~/.config/nvim/plugins.vim'))
    source ~/.config/nvim/plugins.vim
end

" Settings
if filereadable(expand('~/.config/nvim/settings.vim'))
    source ~/.config/nvim/settings.vim
end
