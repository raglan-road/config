#!/bin/zsh
echo "Installing everything we can handle in a script..."

# Install Homebrew via curl
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Homebrew installed. Update!"
brew update

# Install git via Homebrew
echo "Installing git via Homebrew"
brew install git

# Install NVM via Homebrew
echo "Installing nvm via Homebrew"
brew install nvm

echo "Setting up the NVM path"
if [ ! -e ~/.zshrc ]
    then
    echo "Creating a .zshrc in your home directory"
    touch ~/.zshrc
else
    echo "zshrc exists. Appending to it."
fi

echo "Updating zshrc"

echo "export NVM_DIR=~/.nvm\nsource $(brew --prefix nvm)/nvm.sh" >> ~/.zshrc

source ~/.zshrc

# Install kdiff3
brew install --cask kdiff3

# Set some git defaults
git config --global user.name "Adam McIntyre"
git config --global user.email adamjmcintyre@gmail.com
git config --global core.editor nano
git config --global merge.tool kdiff3

# Install node 14 via nvm
echo "Installing node 14"
nvm install 14

# Get TypeScript up and running as a global for tsc:watch, etc.
npm install --global typescript

echo "All set! Next step: clone the repos and have fun!"
