# Dotfiles

## Steps

### Install Homebrew

Follow the steps on https://brew.sh.

### Clone the project

```
git clone https://github.com/ogirginc/dotfiles.git Dotfiles
```

### Create folders

```
mkdir ~/.config/
mkdir ~/.hammerspoon/
```

```
mkdir ~/.config/nvim/
mkdir ~/.config/nvim/.undo/
mkdir ~/.config/nvim/.backup/
mkdir ~/.config/nvim/.swp/
```

### Create links

```
ln -sfn ~/Dotfiles/psqlrc ~/.psqlrc
ln -sfn ~/Dotfiles/zshrc ~/.zshrc
ln -sfn ~/Dotfiles/p10k.zsh ~/.p10k.zsh
```

```
ln -sfn ~/Dotfiles/git/ ~/.config/
```

```
ln -sfn ~/Dotfiles/nvim/lua ~/.config/nvim/
ln -sfn ~/Dotfiles/nvim/init.lua ~/.config/nvim/
```

```
ln -sfn ~/Dotfiles/hammerspoon/init.lua ~/.hammerspoon/
ln -sfn ~/Dotfiles/hammerspoon/Spoons ~/.hammerspoon/
```

```
ln -sFfn ~/Dotfiles/tmuxconf ~/.tmux.conf
ln -sfn ~/Dotfiles/hushlogin ~/.hushlogin
```

### How to bundle

Install [Homebrew](https://brew.sh) and bundle your brewfile;

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle
```
