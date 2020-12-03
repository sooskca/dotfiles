
skip_global_compinit=1

ZDOTDIR=$HOME/.zsh
N_PREFIX=$HOME/.n

path+=('/opt/android-studio/bin')

ANDROID_HOME=$HOME/Coding/android/sdk

ANDROID_SDK_ROOT=$ANDROID_HOME

path+=(${ANDROID_HOME}/emulator)

path+=(${ANDROID_HOME}/tools)

path+=(${ANDROID_HOME}/tools/bin)

path+=(${ANDROID_HOME}/platform-tools)

FLUTTER_HOME=$HOME/.local/share/flutter

path+=(${FLUTTER_HOME}/tools)

path+=(${HOME}/.yarn/bin)

path+=(${HOME}/bin)

export PATH
