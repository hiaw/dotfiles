# Install Caskroom

# brew tap caskroom/versions
# brew cask update

# Install packages

apps=(
    # 1password
    # slack
    # vlc
    # dropbox
    # firefox
    # google-chrome
    # handbrake
    # sourcetree
    # spotify
    # visual-studio-code

    # Quick Look Plugins
    # betterzipql
    # qlcolorcode
    # qlimagesize
    # qlmarkdown
    # qlprettypatch
    # qlstephen
    # quicklook-csv
    # quicklook-json
    # suspicious-package
    # webpquicklook
)

brew install "${apps[@]}"

brew cleanup
