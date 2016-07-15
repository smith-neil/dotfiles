# I named this 1-plugins so that it is the first script to run from this dir
# This allows me to override plugin settings. For example oh-my-zsh's alises

source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle vi-mode

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tarrasch/zsh-autoenv

antigen theme agnoster

antigen apply

