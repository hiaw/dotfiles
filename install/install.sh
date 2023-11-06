# Clone Preston
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

chsh -s /bin/zsh

# VsCode Press and hold
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
