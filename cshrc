set dspmbyte='utf8'

set nobeep
#just in case
alias bell echo -n ''

setenv EUSER `id -un`

set prompt="\[%h|%T\]%% "
set rprompt='%n@%m:%/'

alias precmd 'printf "\033]1;$EUSER@$HOST:r — $shell:t\007"'

# Colorize terminal
alias ls 'ls --color'
setenv LS_COLORS "di=37:ln=36:so=31:pi=33:ex=35:bd=1;32:cd=1;32"
setenv GREP_OPTIONS "--color"


bindkey "^R" i-search-back
bindkey "^ " set-mark-command

# Speakly loudly and carry a small stick
alias cp "cp -iv"
alias mv "mv -iv"
alias rm "rm -iv"
alias ln "ln -i"

alias e "${EDITOR}"
alias .. 'cd ..'
alias -  'cd -'
alias x 'exit'
alias q 'exit'

alias h 'history | grep -i \!*'
