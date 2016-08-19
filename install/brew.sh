# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/devel-only
brew tap Goles/battery
brew tap facebook/fb
brew update
brew upgrade
# Install packages

brew install --devel elm-format

apps=(
    # cli tools
    ack
    buck
    go
    hugo
    watchman
    flow
    the_silver_searcher
    tree
    wget
    python
    trace2html
    # development tools
    git
    markdown
    # Emacs tools
    npm
    ispell
    ctags
    elixir
    erlang
)

brew install "${apps[@]}"

brew cleanup
