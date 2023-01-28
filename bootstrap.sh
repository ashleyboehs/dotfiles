#! /usr/bin/env zsh

cp -n .zshrc ~/.zshrc || echo "~/.zshrc exists. Skipping..."
cp -n .gitignore-global ~/.gitignore || echo "~/.gitignore exists. Skipping..."
cp -n .gitconfig-global ~/.gitconfig || echo "~/.gitconfig exists. Skipping..."

# brew bundle
