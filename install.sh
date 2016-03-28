#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/emacs/spacemacs" ~/.spacemacs
ln -sfv "$DOTFILES_DIR/zsh/zshrc" ~/.zshrc
ln -sfv "$DOTFILES_DIR/runcom/gemrc" ~/.gemrc
ln -sfv "$DOTFILES_DIR/runcom/eslintrc" ~/.eslintrc
ln -sfv "$DOTFILES_DIR/runcom/jsbeautifyrc" ~/.jsbeautifyrc
ln -sfv "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig
ln -sfv "$DOTFILES_DIR/git/gitignore" ~/.gitignore

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/bash.sh"
. "$DOTFILES_DIR/install/npm.sh"
. "$DOTFILES_DIR/install/pip.sh"

if [ "$(uname)" == "Darwin" ]; then
    . "$DOTFILES_DIR/install/brew-cask.sh"
    . "$DOTFILES_DIR/install/gem.sh"
    ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
fi

# Run tests

bats test/*.bats

# Install extra stuff

if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install.sh" ]; then
    . "$EXTRA_DIR/install.sh"
fi
