#!/bin/sh

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

exec i3 -V >> ~/.cache/i3/logs/i3-log-$(date +'%F-%k-%M-%S') 2>&1
