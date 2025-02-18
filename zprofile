path=( /opt/local/bin /opt/local/sbin /usr/local/bin /usr/local/sbin $path )

if [[ -d /usr/local/opt/go/libexec/bin ]] ; then
  path=( /usr/local/opt/go/libexec/bin $path )
fi

# should be set to bin in $GOPATH which defaults to ~/go
if [[ -d ~/go/bin ]] ; then
  path=( ~/go/bin $path )
fi

if [[ -d /usr/local/opt/python/libexec/bin ]] ; then
  path=( /usr/local/opt/python/libexec/bin $path )
fi

if [[ -d ~/local/bin ]] ; then
  path=( ~/local/bin $path )
fi

if [[ -d ~/bin ]] ; then
  path=( ~/bin $path )
fi

if [[ -d /usr/local/opt/cython/bin ]] ; then
  path=( /usr/local/opt/cython/bin $path )
fi

typeset -gxU path

if [[ -f /opt/homebrew/bin/brew ]] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -f ~/.cargo/env ]] ; then
  . ~/.cargo/env
fi

if [[ -f ~/.secrets ]] ; then
  source ~/.secrets
fi
