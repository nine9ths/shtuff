#!/bin/sh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# from https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

########## Variables

#Rewrite this to archive from scripts location
# dir=~/dotfiles                    # dotfiles directory
# olddir=~/dotfiles_old             # old dotfiles backup directory
# #Rewrite this to just use everything in the repository that is not this script
# files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir
# 
# ##########
# 
# # create dotfiles_old in homedir
# echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
# mkdir -p $olddir
# echo "done"
# 
# # change to the dotfiles directory
# echo -n "Changing to the $dir directory ..."
# cd $dir
# echo "done"
# 
# # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
# for file in $files; do
#     echo "Moving any existing dotfiles from ~ to $olddir"
#     mv ~/.$file ~/dotfiles_old/
#     echo "Creating symlink to $file in home directory."
#     ln -s $dir/$file ~/.$file
# done



self=$(basename $0)

files=$(cd ../ && find . -not -path '*.git*' -not -name '.DS_Store' -not -name $self -not -path .)

t='./foo'

for file in $files; do
  f=$(basename $file)
  d=$(dirname $file)
  echo "dir:$d file:$f"
  if [ -d ../$f ]; then
    if [ ! -e ~/$f ]; then
      echo "mkdir $f"
    else
      echo "exists $f"
    fi
  elif [ -x ../$f ]; then
    if [ ! -e ~/$f ]; then
      echo "ln $f"
    else
      echo "replace $f"
    fi
  elif [ -f ../$f ]; then
    if [ ! -e ~/$f ]; then
      echo "ln $f .$f"
    else
      echo "replace .$f"
    fi
  fi
done