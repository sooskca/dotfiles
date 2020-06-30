# zshrc - My zsh configuration
# Maintainer:   José Araújo <sooskca@gmail.com>
# Version:      0.1


# plugins {{{

  ## setup {{{

  export XDG_CACHE_HOME=${XDG_CACHE_HOME:=~/.cache}

  declare -A ZINIT
  ZINIT_HOME=$XDG_CACHE_HOME/zsh/zinit
  ZINIT[HOME_DIR]=$ZINIT_HOME
  ZINIT[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/zcompdump

  if [[ ! -f $ZINIT_HOME/bin/zinit.zsh ]]; then
      git clone https://github.com/zdharma/zinit $ZINIT_HOME/bin
        zcompile $ZINIT_HOME/bin/zinit.zsh
  fi
  source $ZINIT_HOME/bin/zinit.zsh
  load=light

  ## }}}

  ## dependencies {{{

    ### async
    zinit $load mafredri/zsh-async

    ### omz libraries
    zinit ice svn pick"completion.zsh" multisrc'git.zsh \
        functions.zsh {history,grep}.zsh'
    zinit snippet OMZ::lib

  ## }}}

  ## essentials {{{

    ### saneopt
    zinit $load willghatch/zsh-saneopt

    ### ssh-agent
    zinit ice lucid
    zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

    ### zsh-autosuggestions
    zinit ice silent wait:1 atload:_zsh_autosuggest_start
    zinit $load zsh-users/zsh-autosuggestions
    bindkey '\e[3~' delete-char
    bindkey ' '  magic-space
    bindkey '^ ' autosuggest-accept

    ### zsh-completions
    zinit ice blockf; zinit $load zsh-users/zsh-completions

    ### fast-syntax-highlighting
    zinit ice silent wait!1 atload"ZINITM[COMPINIT_OPTS]=-C; zpcompinit"
    zinit $load zdharma/fast-syntax-highlighting

    ### history-search-multi-word
    zstyle ":history-search-multi-word" page-size "11"
    zinit ice wait"1" lucid
    zinit load zdharma/history-search-multi-word
    bindkey '^p' history-search-backward
    bindkey '^n' history-search-forward

  ## }}}

  ## interface {{{

    ### almostontop
    zinit $load Valiev/almostontop

    ### theme
    PS1="READY > "; zinit ice wait'!' lucid; zinit $load sindresorhus/pure

    ### colors

    # manpages
    zinit ice wait lucid
    zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

    # gruvbox
    zinit ice pick"shell/colors.sh" nocompile'!'
    zinit $load morhetz/gruvbox-contrib


    # lscolors
    zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
        atpull'%atclone' pick"clrs.zsh" nocompile'!' \
        atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
    zinit $load trapd00r/LS_COLORS

  ## }}}

  ## programs {{{

    ### autopair
    zinit ice wait:1 lucid; zinit $load hlissner/zsh-autopair

    ### asdf
    zinit ice silent wait:1 pick"asdf.sh" src"completions/asdf.bash"
    zinit $load asdf-vm/asdf

    ### cd-gitroot
    zinit ice silent wait:1; zinit $load mollifier/cd-gitroot

    ### direnv
    zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
        atpull'%atclone' src"zhook.zsh"
    zinit $load direnv/direnv

    ### yank
    zinit ice as"program" pick"yank" make
    zinit light mptre/yank

    ### z
    zinit ice lucid as"command" atload""; zinit $load clvv/fasd
      eval "$(fasd --init auto)"
    zinit ice silent wait:1; zinit $load wookayin/fzf-fasd

    ## }}}

  ## aliases {{{

  ### archlinux
  zinit ice wait lucid
  zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh

  ### extract
  zinit ice wait lucid
  zinit snippet OMZ::plugins/extract/extract.plugin.zsh

  ### git
  zinit ice wait atload"unalias grv" lucid
  zinit snippet OMZ::plugins/git/git.plugin.zsh

  ## }}}

  ## settings {{{

    ###  keybindings {{{

      #### keymap
      zinit $load softmoth/zsh-vim-mode

      #### shortcuts
      zinit $load mdumitru/fancy-ctrl-z

    # }}}

  ## }}}

# }}}
# gvim: fdm=marker ft=zsh
