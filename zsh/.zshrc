# vim: fdm=marker ts=2 sts=2 sw=2
# init.vim - My neovim configuration
# Maintainer:   José Araújo <sooskca@gmail.com>
# Version:      0.1
#
# Plugins {{{

source <(antibody init)

antibody bundle < ~/.zshplugins

# }}}

# Keybindings {{{

bindkey -v

bindkey '^ ' autosuggest-accept

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up

bindkey -M vicmd 'j' history-substring-search-down

# }}}
