# Computer Setup

It would be nice if this was all be scripted, but does not all apply to every machine, has parts that are a pain to script, and changes overtime. Documentation as compromise.

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

### MacDown

```
brew install macdown
```

### emacs

```
brew install emacs
```

### wget

```
brew install wget
```

### lynx

```
brew install lynx
```

### git lfs

```
brew install git-lfs
```

### svn

```
brew install svn
```

### xsv

```
brew install xsv
```
Note: possibly superseded by <https://github.com/jqnatividad/qsv>

### ffmpeg

```
brew install ffmpeg
```

### sox

```
brew install sox
```

### Visual Studio Code

```
brew install visual-studio-code
```

### CLion

```
brew install clion
```

### Go

```
brew install go
```

### Rust

Use rustup

### DiffMerge

```
brew install diffmerge
```


## App Store Apps

- Easy CSV Editor
- JSON Editor
- Microsoft Remote Desktop

## SSH Key

```
ssh-keygen -t rsa
cat .ssh/id_rsa.pub | ssh user@remote.server "mkdir -p .ssh && cat >> .ssh/authorized_keys"
```
