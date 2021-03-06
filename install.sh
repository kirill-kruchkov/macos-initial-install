#!/bin/sh

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Install software
brew cask install 1password
brew cask install slack
brew cask install docker
brew cask install postman
brew cask install zeplin
brew cask install google-chrome
brew cask install typora
brew cask install visual-studio-code
brew cask install iterm2
brew install neovim
brew install zsh
brew install tmux
brew install yarn
brew install tig
brew install jq
brew install cmake
brew install python
brew install bat
brew install autojump

# FiraCode Font
brew tap caskroom/fonts
brew cask install font-fira-code

# NVM & Node & globabl modules
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install latest
npm i -g npm
npm i -g serve svgo

# Nvim config & plugins
pip3 install pynvim
mkdir ~/.config/nvim
cp ./init.vim ~/.config/nvim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall
~/.vim/bundle/LanguageClient-neovim/install.sh
~/.vim/bundle/youcompleteme/install.py

# Zshell, tmux & plugins
cp ./tmux.conf ~/.tmux.conf
cp ./zshrc ~/.zshrc
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
chsh -s /bin/zsh

# Git global config
cp ./gitconfig ~/.gitconfig

# Other configs
defaults write -g ApplePressAndHoldEnabled -bool false # repeat instead of special characters

source /usr/local/share/autojump/autojump.zsh
