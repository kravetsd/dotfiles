#!/bin/bash
# Bootstrap a fresh remote Linux machine.
# Run with:
#   bash <(curl -fsSL https://raw.githubusercontent.com/kravetsd/dotfiles/main/linux/bootstrap.sh)
set -e

DOTFILES_REPO="https://github.com/kravetsd/dotfiles.git"

# Install chezmoi if not present
if ! command -v chezmoi &>/dev/null; then
    echo "Installing chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi

# chezmoi installs to ~/.local/bin — add to PATH for this session
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Persist PATH in .zshrc if not already there
if ! grep -q 'HOME/bin' ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/bin:$HOME/.local/bin:$PATH"' >> ~/.zshrc
    echo "Added ~/bin to PATH in ~/.zshrc"
fi

# Init chezmoi from dotfiles repo and apply
# This also runs run_once_ scripts (package installs etc.)
echo "Applying dotfiles from $DOTFILES_REPO..."
chezmoi init --apply "$DOTFILES_REPO"

echo ""
echo "Done. Restart your shell or run: source ~/.zshrc"
