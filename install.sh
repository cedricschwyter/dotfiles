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
    .gitconfig \
    .oh-my-zsh \
    .tmux.conf \
    .clone \
    .vimrc \
    .zshrc \
    .ctags \
    .i3 \
    .gdbinit \
    .alacritty.yml \
    $HOME
    yes | cp -rf scripts/* \
        $HOME/.local/bin
            mkdir -p $HOME/.config/nvim && cp .config/nvim/init.vim $HOME/.config/nvim
            mkdir -p $HOME/.config/dunst && cp .config/dunst/dunstrc $HOME/.config/dunst
            mkdir -p $HOME/.ctags.d
            ln -s $HOME/.ctags $HOME/.ctags.d/default.ctags
            pip install black isort
            mkdir -p ~/.config/ulauncher/user-themes && git clone https://github.com/sudosubin/one-dark-ulauncher.git ~/.config/ulauncher/user-themes/one-dark-ulauncher

# C++ packages
# clangd
# cppcheck
# clangtidy
# clang-format
# ctags
