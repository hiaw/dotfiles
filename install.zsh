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

# NeoVim
mkdir "${ZDOTDIR:-$HOME}"/.config/nvim
ln -s "${ZDOTDIR:-$HOME}"/.dotfiles/config/nvim/init.vim "${ZDOTDIR:-$HOME}"/.config/nvim/init.vim

# Package managers & packages
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/install.sh
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew.sh

brew bundle install --file "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew.Brewfile