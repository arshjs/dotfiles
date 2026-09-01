# dotfiles

Just config files for some programs that I use.

## Requirements

```zsh
brew install bat eza fzf go node pnpm ripgrep starship stow zoxide

brew install --cask miniconda
```

## Symlink with Stow

Requires [GNU Stow](https://www.gnu.org/software/stow/)

### Create Symlink

```zsh
cd ~/dotfiles

# Dry run Symlink
stow -nv -t ~ .

# Create Symlink
stow -t ~ .

# Update Symlink
stow -R -t ~ .

# Remove Symlink
stow -D -t ~ .
```
