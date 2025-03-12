# Clone Preston
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

chsh -s /bin/zsh

# VsCode Press and hold
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

cd ~ || exit
git clone --single-branch https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
