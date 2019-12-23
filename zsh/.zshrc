# vim: fdm=marker ts=2 sts=2 sw=2
# zshrc - My zsh configuration

# setup {{{
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
# }}}

# plugins {{{

  ## dependencies {{{
    zplugin $load mafredri/zsh-async
    zplugin $load willghatch/zsh-saneopt
  ## }}}

  ## essentials{{{
    zplugin ice silent wait:1 atload:_zsh_autosuggest_start
    zplugin $load zsh-users/zsh-autosuggestions

    zplugin ice blockf; zplugin $load zsh-users/zsh-completions

    zplugin ice silent wait!1 atload"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit"
    zplugin $load zdharma/fast-syntax-highlighting

    zplugin $load axtl/gpg-agent.zsh
  ## }}}

  ## interface {{{
    # keymap
    zplugin $load softmoth/zsh-vim-mode

    # theme
    PS1="READY >"
    zplugin ice wait'!' lucid
    zplugin $load sindresorhus/pure

    # colors

    zplugin ice pick"shell/colors.sh" nocompile'!'
    zplugin $load morhetz/gruvbox-contrib

    zplugin ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
        atpull'%atclone' pick"clrs.zsh" nocompile'!' \
        atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
    zplugin $load trapd00r/LS_COLORS
  ## }}}

  ## programs {{{
    zplugin ice silent wait:1
    zplugin $load rupa/z

    zplugin ice silent wait:1
    zplugin $load asdf-vm/asdf.git

    zplugin ice silent wait:1
    zplugin $load mollifier/cd-gitroot

    zplugin ice silent wait:1
    zplugin $load micha/resty

    zplugin ice as"program" pick"yank" make
    zplugin light mptre/yank

    zplugin ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
    zplugin light sharkdp/fd

    zplugin ice from"gh-r" as"program"
    zplugin $load junegunn/fzf-bin

    zplugin ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
    zplugin $load sharkdp/bat

    zplugin ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
    zplugin $load ogham/exa

    zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
        atpull'%atclone' src"zhook.zsh"
    zplugin $load direnv/direnv

    ## }}}

  ## aliases {{{

  zplugin ice wait lucid
  zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh

  zplugin ice wait atload"unalias grv" lucid
  zplugin snippet OMZ::plugins/git/git.plugin.zsh

  ## }}}

# }}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
