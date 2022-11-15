# Install Caskroom

# brew tap caskroom/versions
# brew cask update

# Install packages

apps=(

# general
    # 1password
    setapp
    slack
    vlc
    # dropbox
    lastpass
    firefox
    google-chrome
    # handbrake
    spotify
    rectangle

    # Development
    sourcetree
    visual-studio-code
    flipper
    android-studio

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

brew install --cask "${apps[@]}"

brew cleanup
