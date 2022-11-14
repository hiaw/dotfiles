(Install Vim Plug)[https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/#install-the-vim-plug-plugin-manager]

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir .config/nvim
ln -s ~/.dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim
nvim
```

Inside NeoVim, run

```
:PlugInstall
```
