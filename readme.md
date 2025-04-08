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
```

```
mkdir ~/.config/nvim/
mkdir ~/.config/nvim/.undo/
mkdir ~/.config/nvim/.backup/
mkdir ~/.config/nvim/.swp/
```

### Create links

```
ln -sfn ~/Dotfiles/zprofile ~/.zprofile
ln -sfn ~/Dotfiles/zshrc ~/.zshrc
```
