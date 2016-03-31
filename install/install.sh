# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Install Phoenix
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# Install correct files for speed-type for emacs
cp ~/.dotfiles/speed-type/speed-type.el ~/.emacs.d/elpa/speed-type-20150120.2034
mkdir ~/.emacs.d/speed-type
cp -rf ~/.dotfiles/speed-type/text_files/ ~/.emacs.d/speed-type/
