#!/bin/sh

cd ~/

pwd

mkdir .ssh

cd .ssh

ssh-keygen

cd ~/

xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

source ~/.zprofile

# Use SSH (if set up)...
#git clone git@github.com:vanpariyar/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/vanpariyar/dotfiles.git ~/.dotfiles

# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

ln -s ~/.dotfiles/macos/.zshrc ~/.zshrc
ln -s ~/.dotfiles/macos/.gitconfig ~/.gitconfig

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/macos/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles/macos && brew bundle