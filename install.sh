# Bunch of symlinks
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/runcom/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/zsh/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/emacs/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/git/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Package managers & packages
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/install.sh
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew.sh
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/npm.sh
# . "${ZDOTDIR:-$HOME}"/.dotfiles/install/pip.sh

if [ "$(uname)" == "Darwin" ]; then
    . "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew-cask.sh
    # . "${ZDOTDIR:-$HOME}"/.dotfiles/install/gem.sh
fi

defaults write -g InitialKeyRepeat -int 8
defaults write -g KeyRepeat -int 2
