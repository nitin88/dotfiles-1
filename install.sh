#!/usr/bin/env bash

brew update
brew upgrade
brew install wget
brew install curl
brew install tmux
brew install reattach-to-user-namespace
brew install git

# -- :BetterVim --------------------------
curl -L https://bettervim.com/install/$BETTER_VIM_LICENSE | bash
ln -sf $PWD/better-vim/overrides.vim ~/.config/better-vim/
ln -sf $PWD/better-vim/plugins.vim ~/.config/better-vim/
ln -sf $PWD/better-vim/better-vim.lua ~/.config/better-vim/
ln -sf $PWD/coc/coc-settings.json ~/.config/nvim/

# -- git ---------------------------------
ln -s -f $PWD/env/.gitconfig ~/

# -- oh-my-zsh + zsh ---------------------
curl -o- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
ln -s -f $PWD/env/.zshrc ~/

# -- tmux --------------------------------
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s -f $PWD/tmux/.tmux.conf ~/.tmux.conf

# -- nvm + custom nvm config for zsh ------ 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
