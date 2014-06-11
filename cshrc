set dspmbyte='utf8'

set nobeep
#just in case
alias bell echo -n ''

setenv EUSER `id -un`

set promptchars='>#'
set prompt="\[%h|%T\]%# "
set rprompt='%n@%m:%/'

alias precmd 'printf "\033]1;$EUSER@$HOST:r — $shell:t\007"'

# Colorize terminal
alias ls 'ls --color'
setenv LS_COLORS "di=37:ln=36:so=31:pi=33:ex=35:bd=1;32:cd=1;32"
setenv GREP_OPTIONS "--color"

bindkey -e
bindkey "^R" i-search-back

# Speakly loudly and carry a small stick
alias cp "cp -iv"
alias mv "mv -iv"
alias rm "rm -iv"
alias ln "ln -i"

# Save keystrokes
alias e "${EDITOR}"
alias .. 'cd ..'
alias -  'cd -'
alias x 'exit'
alias q 'exit'

alias h 'history | grep -i \!*'
