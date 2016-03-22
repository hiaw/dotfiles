# Install Caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
    # dash
    # screenflow
    # sublime-text3
    # vlc
    # webstorm
    1password
    a-better-finder-rename
    betterzip
    cleanmymac
    dropbox
    firefox
    flux
    github-desktop
    google-chrome
    google-drive
    handbrake
    kodi
    postgres
    rescuetime
    sketchup
    skype
    slack
    sourcetree
    spotify
    steam
    textmate
    transmission
    tunnelbear
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

brew cask install "${apps[@]}"


