#!/bin/sh

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Install software
brew cask install 1password
brew cask install slack
brew cask install google-backup-and-sync
brew cask install docker
brew cask install postman
brew cask install tunnelblick
brew cask install zeplin
brew cask install google-chrome
brew cask install typora
brew cask install visual-studio-code
brew cask install iterm2
brew install neovim

# FiraCode Font
brew tap caskroom/fonts
brew cask install font-fira-code

# NVM & Node & globabl modules
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install v8.11.3
nvm alias default v8.11.3
npm i -g npm
npm i -g serve svgo

# Nvim config
mkdir ~/.config/nvim
cp ./init.vim ~/.config/nvim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall

