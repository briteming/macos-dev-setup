#!/usr/bin/env bash
# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
echo "Updating homebrew..."
brew update

echo "Installing Node..."
brew install node

# Remove outdated versions from the cellar.
echo "Removing outdated versions from homebrew..."
brew cleanup

echo "Installing web development utilities..."
brew cask install --appdir="/Applications" gulp
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" ngrok
brew cask install --appdir="/Applications" postman
npm install -g grunt-cli
npm install -g jshint
