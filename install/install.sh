# Clone Preston
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"


# Install Phoenix
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
