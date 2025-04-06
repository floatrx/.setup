#!/bin/bash

# Get the current date in YYYYMMDD format
$DATE=$(date +%Y%m%d)

# Backup existing files
cp ~/.zshrc ~/.zshrc.$DATE.bkp
cp ~/.zsh_aliases ~/.zsh_aliases.$DATE.bkp

# Copy new files
cp ./.zshrc ~/.zshrc
cp ./.zsh_aliases ~/.zsh_aliases