# Clone Preston
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# NeoVim Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# VsCode Press and hold 
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false