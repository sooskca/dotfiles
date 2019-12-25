# zshrc - My zsh configuration
# Maintainer:   José Araújo <sooskca@gmail.com>
# Version:      0.1

# setup {{{

  ## zplugin {{{

  export XDG_CACHE_HOME=${XDG_CACHE_HOME:=~/.cache}

  typeset -A ZPLGM
  ZPLG_HOME=$XDG_CACHE_HOME/zsh/zplugin
  ZPLGM[HOME_DIR]=$ZPLG_HOME
  ZPLGM[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/zcompdump

  if [[ ! -f $ZPLG_HOME/bin/zplugin.zsh ]]; then
      git clone https://github.com/psprint/zplugin $ZPLG_HOME/bin
        zcompile $ZPLG_HOME/bin/zplugin.zsh
  fi
  source $ZPLG_HOME/bin/zplugin.zsh
  load=light

  ## }}}

# }}}

# plugins {{{

  ## dependencies {{{

    ### async
    zplugin $load mafredri/zsh-async

    ### git
    zplugin ice wait lucid
    zplugin snippet OMZ::lib/git.zsh

  ## }}}

  ## essentials {{{

    ### saneopt
    zplugin $load willghatch/zsh-saneopt

    ### zsh-autosuggestions
    zplugin ice silent wait:1 atload:_zsh_autosuggest_start
    zplugin $load zsh-users/zsh-autosuggestions

    ### zsh-completions
    zplugin ice blockf; zplugin $load zsh-users/zsh-completions

    ### fast-syntax-highlighting
    zplugin ice silent wait!1 atload"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit"
    zplugin $load zdharma/fast-syntax-highlighting

    ### history-search-multi-word
    zstyle ":history-search-multi-word" page-size "11"
    zplugin ice wait"1" lucid
    zplugin load zdharma/history-search-multi-word

    # gpg-agent
    zplugin $load axtl/gpg-agent.zsh


  ## }}}

  ## interface {{{

    ### bindings
    zplugin $load softmoth/zsh-vim-mode

    zplugin $load mdumitru/fancy-ctrl-z

    ### theme
    PS1="READY >"
    zplugin ice wait'!' lucid
    zplugin $load sindresorhus/pure

    ### colors
    zplugin ice pick"shell/colors.sh" nocompile'!'
    zplugin $load morhetz/gruvbox-contrib

    zplugin ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
        atpull'%atclone' pick"clrs.zsh" nocompile'!' \
        atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
    zplugin $load trapd00r/LS_COLORS

  ## }}}

  ## programs {{{

    # autopair
    zplugin ice wait lucid
    zplugin load hlissner/zsh-autopair

    # asdf
    zplugin ice silent wait:1
    zplugin $load asdf-vm/asdf.git

    # bat
    zplugin ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
    zplugin $load sharkdp/bat

    # cd-gitroot
    zplugin ice silent wait:1
    zplugin $load mollifier/cd-gitroot

    # direnv
    zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
        atpull'%atclone' src"zhook.zsh"
    zplugin $load direnv/direnv

    # exa
    zplugin ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
    zplugin $load ogham/exa

    # fd
    zplugin ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
    zplugin light sharkdp/fd

    # fzf
    zplugin ice from"gh-r" as"program"
    zplugin $load junegunn/fzf-bin

    # gitignore
    zplugin ice wait"2" lucid
    zplugin load voronkovich/gitignore.plugin.zsh

    # resty
    zplugin ice silent wait:1
    zplugin $load micha/resty

    # yank
    zplugin ice as"program" pick"yank" make
    zplugin light mptre/yank

    # z
    zplugin ice silent wait:1
    zplugin $load rupa/z


    ## }}}

  ## aliases {{{

  ### archlinux
  zplugin ice wait lucid
  zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh

  ### extract
  zplugin ice wait lucid
  zplugin snippet OMZ::plugins/extract/extract.plugin.zsh

  ### git
  zplugin ice wait atload"unalias grv" lucid
  zplugin snippet OMZ::plugins/git/git.plugin.zsh

  ## }}}

  ## settings {{{

    ### history
    zplugin ice wait lucid
    zplugin snippet OMZ::lib/history.zsh

  ## }}}

# }}}
# vim: fdm=marker
