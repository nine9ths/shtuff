# Computer Setup

## Install XCode Commandline Tools

```
xcode-select --install
```

## Configure Terminal/Shell

```
mkdir ~/Development
cd ~/Development
git clone <this-repo>
```

Terminal > Preferences > Profiles > ··· > Import… [../settings/Default.terminal](../settings/Default.terminal)

### Create env symlinks

```
cd ~
ln -s ~/Development/shtuff/zprofile .zprofile
ln -s ~/Development/shtuff/zshenv .zshenv
ln -s ~/Development/shtuff/zshrc .zshrc
ln -s ~/Development/shtuff/screenrc .screenrc
ln -s ~/Development/shtuff/gitconfig .gitconfig
ln -s ~/Development/shtuff/gitignore .gitignore
```

### Create work specific settings

```
ln -s /path/to/some/cloud/storage/workprofile .workprofile
ln -s /path/to/some/cloud/storage/workgitconfig .workgitconfig
```

Example workprofile:

```
export IMPORTANT_DIR="$HOME/Work/important/dir"
```

Example workgitconfig:

```
[user]
        name = Your Name
        email = your_email@yourcompany.com
```


## Install Homebrew

<https://brew.sh>

## Install Fonts
```
open /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*
```

## Install Software

### BBEdit

<https://www.barebones.com/products/bbedit/download.html>

Defaults: [../settings/bbedit.defaults](../settings/bbedit.defaults)

Sync keyboard shortcuts

```
cd ~/Library/Application\ Support/BBEdit/Setup/
ln -s ~/Development/shtuff/settings/HOME/Library/Application\ Support/BBEdit/Setup/Menu\ Shortcuts.plist
```

### Sublime Text

<https://www.sublimetext.com>

Install Package Control

Sync settings

```
cd ~/Library/Application\ Support/Sublime\ Text/Packages/
ln -s ~/Development/shtuff/settings/Library/Application\ Support/Sublime\ Text/Packages/User
```

### Macdown

```
brew install macdown
```
