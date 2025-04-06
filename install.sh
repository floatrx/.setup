#!/bin/bash

# Get the current date in YYYYMMDD format
$DATE=$(date +%Y%m%d)

set -e

echo "🚀 Installing dotfiles and dependencies..."

# ───────────────────────────────────────────────
# 1. Check if Homebrew is installed, if not, install it
if ! command -v brew &> /dev/null; then
    echo "⚙️ Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "🍺 Homebrew is already installed."
fi

# ───────────────────────────────────────────────
# 2. Backup existing .zshrc and .zsh_aliases (if they exist)
echo "🔙 Backing up existing .zshrc and .zsh_aliases..."

# Backup .zshrc if it exists
if [ -f ~/.zshrc ]; then
  echo "💾 Backing up ~/.zshrc to ~/.zshrc.$DATE.bkp"
  cp ~/.zshrc ~/.zshrc.$DATE.bkp
fi

# Backup .zsh_aliases if it exists
if [ -f ~/.zsh_aliases ]; then
  echo "💾 Backing up ~/.zsh_aliases to ~/.zsh_aliases.$DATE.bkp"
  cp ~/.zsh_aliases ~/.zsh_aliases.$DATE.bkp
fi

# ───────────────────────────────────────────────
# 3. Create symbolic links for .zshrc and .zsh_aliases
echo "🔗 Creating symbolic links for .zshrc and .zsh_aliases..."

ln -sf ./setup/.zshrc ~/.zshrc
ln -sf ./setup/.zsh_aliases ~/.zsh_aliases

# ───────────────────────────────────────────────
# 4. Run setup scripts for environment configuration
echo "🔧 Running environment setup scripts..."

# Run Zsh environment setup
bash ./setup/setup-zsh-env.sh

# Install additional apps via brew
bash ./setup/brew-apps-setup.sh

echo "✅ Done! You can now source ~/.zshrc to apply the changes."
echo "💡 Don't forget to restart your terminal or run 'source ~/.zshrc'."
