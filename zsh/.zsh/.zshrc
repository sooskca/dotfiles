# vim: fdm=marker ts=2 sts=2 sw=2
# init.vim - My neovim configuration
# Maintainer:   José Araújo <sooskca@gmail.com>
# Version:      0.1

# Options {{{

EDITOR=vim

setopt correct                    # correct spelling for commands
setopt interactive_comments       # allow # comments in shell; good for copy/paste
unsetopt correct_all              # do no show 'suggestions'
export BLOCK_SIZE="'1"            # add commas to file sizes

typeset -U path                   # keep duplicates out of the path


# History {{{
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

setopt append_history              # allow multiple sessions to append to one history
setopt bang_hist                   # treat ! special during command expansion
setopt extended_history            # Write history in :start:elasped;command format
setopt hist_expire_dups_first      # expire duplicates first when trimming history
setopt hist_find_no_dups           # When searching history, don't repeat
setopt hist_ignore_dups            # ignore duplicate entries of previous events
setopt hist_ignore_space           # prefix command with a space to skip it's recording
setopt hist_reduce_blanks          # Remove extra blanks from each command added to history
setopt hist_verify                 # Don't execute immediately upon history expansion
setopt inc_append_history          # Write to history file immediately, not when shell quits
setopt share_history               # Share history among all sessions
# }}}

# Completion
autoload -Uz compinit && compinit
setopt complete_in_word            # cd /ho/sco/tm<TAB> expands to /home/scott/tmp
setopt auto_menu                   # show completion menu on succesive tab presses
setopt autocd                      # cd to a folder just by typing it's name
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&' # These "eat" the auto prior space after a tab complete
# }}}

# Plugins {{{

source <(antibody init)

antibody bundle < $ZDOTDIR/.zshplugins

zstyle :plugin:history-search-multi-word reset-prompt-protect 1

NORMAL_MODE_INDICATOR="%{$FX[italic]$FG[201]%}NORMAL%{$FX[reset]%}"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}}

# Keybindings {{{

bindkey -e
#bindkey -v
bindkey '\e[3~' delete-char
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey ' '  magic-space
bindkey '^ ' autosuggest-accept


# }}}
