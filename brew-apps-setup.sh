#!/bin/bash

set -e

echo "🔄 Updating Homebrew..."
brew update

echo "🔄 Upgrading Homebrew..."
brew upgrade

echo "📦 Installing useful CLI tools..."
brew install git \
             node \
             oven-sh/bun/bun \
             nvm \
             jq \
             sqlite \
             vercel-cli \
             htop \
             btop \
             tree

echo "🖥 Installing apps (casks)..."
brew install --cask iterm2 \
                    figma \
                    font-fira-code \
                    notion \
                    obsidian \
                    visual-studio-code \
                    vlc

echo "✅ All GUI & CLI apps

