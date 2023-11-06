# Bunch of symlinks
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/runcom/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/zsh/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/git/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

mkdir -p "${ZDOTDIR:-$HOME}/.config"
ln -s "${ZDOTDIR:-$HOME}/.dotfiles/config/kitty" "${ZDOTDIR:-$HOME}/.config/kitty"
ln -s "${ZDOTDIR:-$HOME}/.dotfiles/config/nvim" "${ZDOTDIR:-$HOME}/.config/nvim"

chsh -s /bin/zsh

# Package managers & packages
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/install.sh
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew.sh

# brew bundle install --file "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew.Brewfile

case "$OSTYPE" in
  darwin*)
    # ...
  ;;
  linux*)
    # ...
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs 18.17.1

  npm install -g prettier typescript typescript-language-server
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # ...
  ;;
esac

