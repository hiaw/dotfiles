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


# NeoVim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
ln -s "${ZDOTDIR:-$HOME}"/.dotfiles/config/custom "${ZDOTDIR:-$HOME}"/.config/nvim/custom
# mkdir "${ZDOTDIR:-$HOME}"/.config/nvim
# ln -s "${ZDOTDIR:-$HOME}"/.dotfiles/config/nvim/init.vim "${ZDOTDIR:-$HOME}"/.config/nvim/init.vim

# Package managers & packages
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/install.sh
. "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew.sh

brew bundle install --file "${ZDOTDIR:-$HOME}"/.dotfiles/install/brew.Brewfile

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

