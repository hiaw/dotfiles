set -eo pipefail
setopt EXTENDED_GLOB

dotfiles="${ZDOTDIR:-$HOME}/.dotfiles"

for rcfile in "$dotfiles"/runcom/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "$dotfiles"/zsh/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "$dotfiles"/git/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

mkdir -p "${ZDOTDIR:-$HOME}/.config"
# ln -sf "$dotfiles/config/kitty" "${ZDOTDIR:-$HOME}/.config/kitty"
ln -sf "$dotfiles/config/nvim" "${ZDOTDIR:-$HOME}/.config/nvim"
ln -sf "$dotfiles/config/zellij" "${ZDOTDIR:-$HOME}/.config/zellij"
ln -sf "$dotfiles/config/mise" "${ZDOTDIR:-$HOME}/.config/mise"

chsh -s /bin/zsh || true

. "$dotfiles/install/install.sh"
. "$dotfiles/install/brew.sh"

brew bundle install --file "$dotfiles/install/brew.Brewfile"

case "$OSTYPE" in
  darwin*)
    # ...
  ;;
  linux*)
    # ...
  npm install -g prettier typescript typescript-language-server
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # ...
  ;;
esac
