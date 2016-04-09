# Clone Preston
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"


# Install Phoenix
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# Set the default key repeats
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 2

# Use Karabiner to use VI keys in preview
ln -svf ~/.dotfiles/install/private.xml ~/Library/Application\ Support/Karabiner/private.xml

# Clone Elixir source so we have access to documentation in emacs
git clone https://github.com/elixir-lang/elixir.git /usr/local/sources/elixir
git clone https://github.com/erlang/otp.git /usr/local/sources/erlang
