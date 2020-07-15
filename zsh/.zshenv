
skip_global_compinit=1

ZDOTDIR=$HOME/.zsh

source $ZDOTDIR/.aliases

source $HOME/.secrets

path+=('/opt/android-studio/bin')

xmodmap ~/.Xmodmap

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

ANDROID_HOME=$HOME/Coding/android/sdk

ANDROID_SDK_ROOT=$ANDROID_HOME

path+=(${ANDROID_HOME}/emulator)

path+=(${ANDROID_HOME}/tools)

path+=(${ANDROID_HOME}/tools/bin)

path+=(${ANDROID_HOME}/platform-tools)

FLUTTER_HOME=$HOME/.local/share/flutter

path+=(${FLUTTER_HOME}/tools)

export PATH
