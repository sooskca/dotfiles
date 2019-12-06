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

zplugin $load willghatch/zsh-saneopt

zplugin $load mafredri/zsh-async
zplugin $load rupa/z
zplugin $load sindresorhus/pure
zplugin $load softmoth/zsh-vim-mode
zplugin $load wyntau/fzf-zsh
zplugin $load zpm-zsh/linuxbrew
zplugin $load kiurchv/asdf.plugin.zsh

#denisidoro/navi
zplugin ice as"program"
zplugin $load denisidoro/navi

#junegunn/fzf
zplugin ice from"gh-r" as"program"
zplugin $load junegunn/fzf-bin

# sharkdp/bat
zplugin ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zplugin light sharkdp/bat

# ogham/exa, replacement for ls
zplugin ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zplugin light ogham/exa

zplugin ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zplugin light trapd00r/LS_COLORS

zplugin ice silent wait:1 atload:_zsh_autosuggest_start
zplugin $load zsh-users/zsh-autosuggestions

zplugin ice blockf; zplugin $load zsh-users/zsh-completions

zplugin ice silent wait:1; zplugin $load mollifier/cd-gitroot
zplugin ice silent wait:1; zplugin $load micha/resty
zplugin ice silent wait:1; zplugin $load supercrabtree/k

zplugin ice silent wait!1 atload"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit"
zplugin $load zdharma/fast-syntax-highlighting
