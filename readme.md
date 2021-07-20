# Dotfiles

### How to clone

```
git clone https://github.com/ogirginc/dotfiles.git Dotfiles
```

### Create folders

```
mkdir -p ~/.config/nvim/
mkdir ~/.config/nvim/.undo/
mkdir ~/.config/nvim/.backup/
mkdir ~/.config/nvim/.swp/
mkdir ~/.hammerspoon/
```

### How to link

```
ln -sfn ~/Dotfiles/zshrc ~/.zshrc
ln -sfn ~/Dotfiles/p10k.zsh ~/.p10k.zsh
```

```
ln -sfn ~/Dotfiles/git/ ~/.config/
```

```
ln -sfn ~/Dotfiles/nvim/config/ ~/.config/nvim/
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

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle
```
