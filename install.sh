#!/bin/sh
git submodule sync
git submodule update --init --recursive
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
mkdir -p $ZSH_CUSTOM
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] ; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi
if [ ! -d "$ZSH_CUSTOM/plugins/auto-ls" ] ; then
    git clone https://github.com/desyncr/auto-ls.git $ZSH_CUSTOM/plugins/auto-ls
fi
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
mkdir -p $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
yes | cp -rf .bash_profile \
    .bashrc \
    .oh-my-zsh \
    .tmux.conf \
    .zshrc \
    .i3 \
    .gdbinit \
    .alacritty.yml \
    .p10k.zsh \
    $HOME

mkdir -p $HOME/.local/bin
yes | cp -rf scripts/* \
    $HOME/.local/bin/

rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim 
cp -r .config/nvim/* $HOME/.config/nvim/
mkdir -p $HOME/.config/dunst && cp .config/dunst/dunstrc $HOME/.config/dunst
mkdir -p $HOME/.config/qutebrowser && cp -r .config/qutebrowser/* $HOME/.config/qutebrowser
mkdir -p $HOME/.ctags.d
ln -s $HOME/.ctags $HOME/.ctags.d/default.ctags
yay -S --noconfirm python-black python-isort
mkdir -p ~/.config/ulauncher/user-themes && git clone https://github.com/sudosubin/one-dark-ulauncher.git ~/.config/ulauncher/user-themes/one-dark-ulauncher

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ -f .d3psi-desktop ]; then
    cp .config/picom.conf $HOME/.config/picom.conf
    cp .gitconfig $HOME/.gitconfig
    cp .alacritty-desktop.toml $HOME/.alacritty.toml
fi

if [ -f .d3psi-xps ]; then
    cp .gitconfig $HOME/.gitconfig
fi

sudo cp usgermanumlaut /usr/share/X11/xkb/symbols/
cp -r .config/aerc/* $HOME/.config/aerc/

echo "Finished install of config files"
