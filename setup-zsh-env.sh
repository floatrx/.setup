#!/bin/bash

set -e

echo "🔧 Installing Homebrew (if not installed)..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || true

echo "🔄 Updating Homebrew..."
brew update

echo "📦 Installing core packages..."
brew install zsh \
             font-jetbrains-mono-nerd-font \
             zsh-autosuggestions \
             fzf \
             z


echo "🎨 Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" || true

echo "⚙️ Installing Oh My Zsh..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

echo "🔌 Installing alias-tips plugin..."
git clone https://github.com/djui/alias-tips.git "$HOME/.oh-my-zsh/custom/plugins/alias-tips" || true

echo "🔧 Setting up fzf..."
"$(brew --prefix)/opt/fzf/install" --all

echo "✅ All dependencies installed!"
echo "💡 Now, copy your .zshrc and .p10k.zsh to your home directory and restart your terminal."


