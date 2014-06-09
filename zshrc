# Behavior options
setopt NO_BEEP                     # stop the insanity
setopt AUTO_MENU                   # <TAB> once for listing <TAB> again to cycle
setopt PROMPT_SUBST                # use vars in $prompt
setopt MULTIOS                     # allow multiple > or <
setopt NO_FLOW_CONTROL             # ctrl-s won't freeze the terminal anymore

# Completion options
setopt NO_AUTO_REMOVE_SLASH        # don't remove slash at end of command
setopt COMPLETE_IN_WORD            # complete from cursor at both ends

# Globbing options
setopt EXTENDED_GLOB               # extra globbing syntax options
setopt NO_NOMATCH                  # warn on bad multi glob instead of error
setopt CSH_NULL_GLOB               # warn only on entirely bad multi globs
setopt NUMERIC_GLOB_SORT           # numeric filenames are sorted numerically

# History options
setopt APPEND_HISTORY              # new history lines are added to $HISTFILE on exit
setopt HIST_IGNORE_ALL_DUPS        # duplicates are replaced with new commands
#setopt HIST_EXPIRE_DUPS_FIRST     # get rid of duplicates first when history overflows
#setopt HIST_FIND_NO_DUPS          # don't find duplicate commands in history
#setopt HIST_SAVE_NO_DUPS          # don't write duplicate commands in history

# cd/pushd options
setopt AUTO_CD                     # typing a directory goes to that directory
setopt CD_ABLE_VARS                # omit $ from vars with paths
setopt AUTO_NAME_DIRS              # make named directories automatically available to the user
                                   # (otherwise you have to use them explicitly before the shell registers them)
setopt AUTO_PUSHD                  # make cd push the old directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS           # don't push dup directories onto the directory stack.
setopt PUSHD_SILENT                # don't print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME               # have pushd with no arguments act like `pushd $HOME'.
setopt MARK_DIRS                   # append `/' to directory names resulting from globbing

# Unadopted options	           
#setopt NO_HUP                     # don't terminate processes on exit
#setopt GLOB_DOTS                  # leading `.' in a filename matched implicitly
#setopt NO_CLOBBER                 # don't overwrite existing files with redirection
#setopt HISTORY_ALLOW_CLOBBER      # if NO_CLOBBER is set to make error correction easier
#setopt CHASE_LINKS                # don't use symbolic links in $cwd
#setopt TRANSIENT_RPROMPT          # remove the rprompt after the command is entered
#setopt INC_APPEND_HISTORY         # new history lines are added to $HISTFILE incrementally instead of on exit
#setopt EXTENDED_HISTORY           # history reports extra info but breaks .history compatibility with other shells

# autoload colors zsh/terminfo
# if [[ "$terminfo[colors]" -ge 8 ]]; then
#   colors
# fi

# Load functions to put git branch data in prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/bin/git-prompt.sh

GIT_PS1_SHOWUPSTREAM="verbose"
# GIT_PS1_SHOWDIRTYSTATE=1

# Adapted from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
function prompt_char {
  test $STY >/dev/null 2>&1 && echo -n $WINDOW | tr '0123456789' '⁰¹²³⁴⁵⁶⁷⁸⁹'
  git branch >/dev/null 2>&1 && echo '€' && return
  svn info >/dev/null 2>&1 && echo '$' && return
  test -s CVS/Root >/dev/null 2>&1 && echo '¢' && return
  echo '%#'
}

# Adding faint to prompt %{\e[02m%}faint text%{\e[0m%}

# use psvar for this?
# Set the prompts
PROMPT='[%h|%T$(__git_ps1 "|%%B%s%%b")]$(prompt_char) '
RPROMPT='%n@%m:%/'

precmd () {
  # Set the window title
  print -Pn "\e]0;%n@%m\a"
}

HISTSIZE=500
#SAVEHIST=200                   # save history file
#HISTFILE=~/.history

manpath=( /opt/local/man /usr/local/man $manpath )
typeset -U path manpath               # uniquify paths

export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

export EDITOR='/usr/bin/emacs'
export PAGER='/usr/bin/more'
export MANPAGER='/usr/bin/ul'

export GIT_PAGER='/bin/cat'

export FTP_PASSIVE=1

export XML_CATALOG_FILES="${HOME}/Work/svn/code/schemas/catalog.xml"

source ~/.cvsprofile

# Keybindings

bindkey -e               # emacs key bindings
# bindkey -m             # binds ESC to META and disables multibyte support
# bindkey -v             # vi key bindings

bindkey ' '    magic-space         # also do history expansion on space
bindkey '^ '   set-mark-command    # like emacs also ^@ by default
bindkey '^X?'  expand-cmd-path     # like tcsh
bindkey '^w'   kill-region         # like emacs
bindkey '^[k'  backward-kill-line  # like emacs
bindkey '^[^?' backward-kill-word  # like emacs
bindkey "^[^p" history-beginning-search-backward
bindkey "^[^n" history-beginning-search-forward

# Colorize terminal
export CLICOLOR=1;
# Need LSCOLORS for OS X ls and LS_COLORS for zsh completion
export LSCOLORS='hxgxbxdxcxFxFxCxCxHxhx'
export LS_COLORS='di=37:ln=36:so=31:pi=33:ex=32:bd=1;35:cd=1;35:su=1;32:sg=1;32:tw=1;37:ow=37'
export GREP_OPTIONS='--color'

# Speak loudly, and carry a small stick
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ln='ln -i'

# move about easier
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# save keystrokes
alias e='${EDITOR}'
alias x='exit'
alias q='exit'
alias c='clear'
alias ll='ls -l'
alias zz='exec zsh -l'             # new zsh, -l is for login shell

# do things
alias bell='print -n '

alias xsdate='date "+%Y-%m-%d"'
alias xsdatetime='date "+%Y-%m-%dT%H:%M:%S%z" | sed -e "s/\(.*\)\(..\)/\1:\2/"'
alias epoch='date "+%s"'

# serial move
autoload -U zmv
alias mmv='noglob zmv -W'

# setup completion system
autoload -U compinit
compinit

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Adapted from http://zshwiki.org/home/examples/compsys/hostnames
local hosts
if [[ -f $HOME/.hosts ]]; then
  hosts=($(paste -sd' ' $HOME/.hosts))
  zstyle ':completion:*' hosts $hosts
fi

### Functions #should be moved elsewhere eventually

# cp function to cp -f if set cp -i if not
#alias cpf='\cp -fv' # just in case

# function less_or_ls {
#     #this is bugged for pipes
#     if [[ $# == 0 ]]; then
#         ls .
# #add or for dirs
#     else
#         less $*
#     fi
# }

# alias less="less_or_ls"

function realpath() {
  for f in "$@";
  do echo ${f}(:A);
  done
}

function trash {
  mv $* ~/.Trash
}

function h {
  if [[ $# == 0 ]]; then
    history 1 | grep -Ev '[[:digit:]] +(h|history)( |$)'
  else
    history 1 | grep -i $* | grep -Ev '[[:digit:]] +(h|history)( |$)'
  fi
}

alias h="noglob h"

function calc {
  python3 -c "from math import *;print($*)"
}

alias calc='noglob calc'

# These should all be rewritten to use xml tools
function xqy {
  saxon.sh -xqy -s $1 {$*[2,-1]}
}

alias xqy="noglob xqy"

function tag {
  perl -0ne 's/(\n*\r\n*)+/\n/g;print qq/$ARGV:\n/;while(m{(<'$1'[^-].*?</'$1'>)}sigc){print qq/$1\n/}' $*[2,-1]
}

function tage {
  perl -0ne 's/[\r\n]//g;while(m{(<'$1'[^-].*?>)}sigc){print qq/$ARGV: $1\n/}' $*[2,-1]
}

function tagg {
  perl -0ne 's/\s+/ /g;while(m{(<'$1'[^-].*?</'$1'>)}sigc){print qq/$ARGV: $1\n/}' $*[2,-1]
}

function tagx {
  report=$(perl -0ne 's/\s+/ /sg;print qq/<file path="$ARGV">/;while(m{(<'$1'[^-].*?</'$1'>)}sigc){print qq/<fragment>$1<\/fragment>/};print qq/<\/file>\n/' $*[2,-1])
  echo "<report>$report</report>" | xmllint --format -
}

#setenv() { export $1=$2 }      # csh compatibility



### OS X specific stuff only useful if connected locally
if [[ -z $SSH_CONNECTION ]]; then

alias sss='open /System/Library/Frameworks/Screensaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

# randomize the terminal color if not a screen
if [[ -z $STY ]]; then
  color-fg.sh
fi

# function o {
#   #this is bugged for pipes
#   if [[ $# == 0 ]]; then
#     open .
#   else
#     open $*
#   fi
# }
# 
# alias open='o'

# will open a new terminal window and do command args
function  new {
  arch -i386 osascript -e "tell window 1 of application \"Terminal\" to do script \"$*\""
}

fi

