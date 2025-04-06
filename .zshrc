# ───────────────────────────────────────────────
[ -f ~/.env ] && source ~/.env

# Powerlevel10k Instant Prompt (keep this at the very top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ───────────────────────────────────────────────
# PATHs
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Applications/WebStorm.app/Contents/MacOS:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ───────────────────────────────────────────────
# Oh My Zsh + Powerlevel10k
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions alias-tips)
source $ZSH/oh-my-zsh.sh




# Powerlevel10k configuration
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ───────────────────────────────────────────────
# Aliases
# Source general aliases
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# Source private aliases (won't be public)
[[ -f ~/.zsh_aliases_private ]] && source ~/.zsh_aliases_private

# ───────────────────────────────────────────────
# Autocompletion
autoload -Uz compinit
compinit

# z - directory navigation (after compinit!)
_z_file="$(brew --prefix)/etc/profile.d/z.sh"
if [ -f "$_z_file" ]; then
  unset -f _z 2>/dev/null
  unalias z 2>/dev/null
  source "$_z_file"
fi

# ───────────────────────────────────────────────
# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ───────────────────────────────────────────────
# fzf integration (if installed)
/bin/test -f ~/.fzf.zsh && source ~/.fzf.zsh

# ───────────────────────────────────────────────
# ngrok completions
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# ───────────────────────────────────────────────
# VSCode shell integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# ───────────────────────────────────────────────
# Node / bun / nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ───────────────────────────────────────────────
# SQLite flags
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# ───────────────────────────────────────────────
# Homebrew
export HOMEBREW_NO_ENV_HINTS=true