# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew update
brew upgrade

# Install packages

brew install --with-cocoa emacs

apps=(
    # cli tools
    ack
    tree
    wget
    elm
    # development tools
    git
    markdown
    # Emacs tools
    ispell
    ctags
    elixir
    erlang
)

brew install "${apps[@]}"

brew cleanup