# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade
# Install packages

apps=(
    # cli tools
    # ack
    # go
    watchman
    # the_silver_searcher
    # tree
    wget

    # development tools
    git
    asdf
    neovim
    # markdown
)

brew install "${apps[@]}"

brew cleanup
