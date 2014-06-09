path=( /opt/local/bin /opt/local/sbin /usr/local/bin $path )

if [[ -d ~/local/bin ]] ; then
  path=( ~/local/bin $path )
fi
if [[ -d ~/bin ]] ; then
  path=( ~/bin $path )
fi

# Setting PATH for Python 3.4
path=( /Library/Frameworks/Python.framework/Versions/3.4/bin $path )

typeset -gxU path
