which xmodmap && ln .Xmodmap ~/.Xmodmap
which i3 && {
mkdir -p ~/.config/i3
ln .config/i3 ~/.config/i3
}
which tmux && ln .tmux.conf ~/.tmux.conf
which zsh && ln .zshrc ~/zshrc

cd ~
if which nvim
then
    plug_dir="~/.config/nvim/autoload"
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs $plug_dir
    nvim +PlugInstall
else
    plug_dir="~/.vim/autoload"
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs $plug_dir
    vim +PlugInstall
fi
