#!/bin/bash

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
  echo "💾 Backing up ~/.zshrc to ~/.zshrc.backup"
  cp ~/.zshrc ~/.zshrc.backup
fi

# Backup .zsh_aliases if it exists
if [ -f ~/.zsh_aliases ]; then
  echo "💾 Backing up ~/.zsh_aliases to ~/.zsh_aliases.backup"
  cp ~/.zsh_aliases ~/.zsh_aliases.backup
fi

# ───────────────────────────────────────────────
# 3. Create symbolic links for .zshrc and .zsh_aliases
echo "🔗 Creating symbolic links for .zshrc and .zsh_aliases..."

ln -sf ~/Projects/Floatrx/setup/.zshrc ~/.zshrc
ln -sf ~/Projects/Floatrx/setup/.zsh_aliases ~/.zsh_aliases

# ───────────────────────────────────────────────
# 4. Run setup scripts for environment configuration
echo "🔧 Running environment setup scripts..."

# Run Zsh environment setup
bash ~/Projects/Floatrx/setup/setup-zsh-env.sh

# Install additional apps via brew
bash ~/Projects/Floatrx/setup/brew-apps-setup.sh

echo "✅ Done! You can now source ~/.zshrc to apply the changes."
echo "💡 Don't forget to restart your terminal or run 'source ~/.zshrc'."
