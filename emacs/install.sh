# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


# Install correct files for speed-type for emacs
rm ~/.emacs.d/elpa/speed-type-20150120.2034/speed-type.elc
cp ~/.dotfiles/emacs/speed-type/speed-type.el ~/.emacs.d/elpa/speed-type-20150120.2034
mkdir ~/.emacs.d/speed-type
cp -rf ~/.dotfiles/emacs/speed-type/text_files/ ~/.emacs.d/speed-type/
