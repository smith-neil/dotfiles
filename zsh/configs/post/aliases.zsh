alias l='ls -lFh'                   # size,show,type,human readable
alias la='ls -lAFh'                 # long list,show almost all, show type,human readable
alias lr='ls -tRFh'                 # sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'                 # long list,sorted by date,show type,human readable
alias ll='ls -l'                    # long list
alias ldot='ls -ld .*'              # long list,only shows dotfiles
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep="grep --color"
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVN} '
alias hgrep='fc -EL 0 | grep'

alias t='tail -f'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'
alias -g LL='2>&1 | less'
alias -g CA='2>&1 | cat -A'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g P='2>&1| pygemtize -l pytb'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias sortnr='sort -nr'

alias rm='rm -i'
alias mv='mv -i'

alias pac='pacaur'
alias pacin='pacaur -S'
alias pacloci='pacaur -Qi'
alias paclocs='pacaur -Qs'
alias paclsorphans='pacaur -Qdtq'
alias pacre='pacaur -R'
alias pacrem='pacaur -Rsn'
alias pacrepi='pacaur -Si'
alias pacreps='pacaur -Ss'
alias pacupd='pacaur -Sy'
alias pacupg='pacaur -Syu'

alias nmstatus='nmcli general status'
alias nmactive='nmcli connection show --active'
alias nmwifistatus='nmcli radio wifi'
alias nmwifioff='nmcli radio wifi off'
alias nmwifion='nmcli radio wifi on'
alias nmwifilist='nmcli device wifi list'
alias nmwificon='nmcli device wifi connect'
alias nmdevstatus='nmcli device status'
alias nmdevdiscon='nmcli device disconnect iface'
alias nmconmake='nmcli connection edit con-name'
alias nmconedit='nmcli connection edit'

alias atom="atom-git"

