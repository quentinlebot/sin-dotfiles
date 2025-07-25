#!/bin/bash

# Check if running on Arch Linux
if [[ ! -f /etc/arch-release ]]; then
    echo "This script is designed for Arch Linux only."
    echo "Detected: $(uname -s)"
    exit 1
fi

echo "Arch Linux detected..."

# Update system packages
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install packages from official repositories
echo "Installing official packages..."
sudo pacman -S --needed --noconfirm \
    bat \
    fd \
    fzf \
    ghostty \
    git \
    lua \
    luajit \
    luarocks \
    neovim \
    nodejs \
    npm \
    make \
    prettier \
    ripgrep \
    stow \
    tmux \
    tree \
    tree-sitter \
    zoxide \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

# Install packages from AUR
echo "Installing AUR packages..."
yay -S --needed --noconfirm \
    lazygit \
    opencode-ai-bin \
    starship \
    ttf-hack-nerd \
    ttf-jetbrains-mono-nerd

# Install packages from NPM
sudo npm install -g \
    @anthropic-ai/claude-code \
    @ast-grep/cli

# Linux-specific configurations
echo "Configuring for Linux..."
# Set zsh as default shell if not already
if [[ "$SHELL" != */zsh ]]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
fi
echo "Installation complete..."

echo "Dotfiles setup"
# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "Dotfiles setup complete!"

