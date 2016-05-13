# Install Caskroom

brew tap caskroom/versions
brew cask update

# Install packages

apps=(
    # 1password
    # cleanmymac
    dash
    # screenflow
    # sketchup
    # slack
    # sublime-text3
    # transmission
    # tunnelbear
    # vlc
    # webstorm
    a-better-finder-rename
    betterzip
    dropbox
    firefox
    # flux
    github-desktop
    google-chrome
    google-drive
    handbrake
    iterm2
    java
    karabiner
    kodi
    mactex
    pgadmin3
    postgres
    rescuetime
    # skype
    sourcetree
    spotify
    sqlitebrowser
    # steam
    textmate
    xiami
    visual-studio-code

    # Quick Look Plugins
    betterzipql
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    suspicious-package
    webpquicklook
)

brew cask install --appdir="/Applications" "${apps[@]}"

brew cask cleanup
