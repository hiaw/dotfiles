# Install Caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
    # 1password
    # cleanmymac
    # dash
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
    flux
    github-desktop
    google-chrome
    google-drive
    handbrake
    iterm2
    kodi
    postgres
    rescuetime
    skype
    sourcetree
    spotify
    steam
    textmate
    visual-studio-code
    pgadmin3

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
