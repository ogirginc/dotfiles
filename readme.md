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
ln -sfn ~/Dotfiles/hushlogin ~/.hushlogin
```

```
ln -sfn ~/Dotfiles/nvim/lua ~/.config/nvim/
ln -sfn ~/Dotfiles/nvim/init.lua ~/.config/nvim/
```

```
ln -sfn ~/Dotfiles/psqlrc ~/.psqlrc
```
