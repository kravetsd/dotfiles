#!/bin/bash
# Runs once per machine (re-runs if this file changes).
# Installs all required system packages for the terminal dev environment.
set -e

# --- apt packages ---
packages=(tmux git make unzip ripgrep fd-find)
to_install=()

for pkg in "${packages[@]}"; do
    if ! dpkg -l "$pkg" &>/dev/null; then
        to_install+=("$pkg")
    fi
done

if [ ${#to_install[@]} -gt 0 ]; then
    echo "Installing: ${to_install[*]}"
    sudo apt-get update -qq
    sudo apt-get install -y "${to_install[@]}"
else
    echo "All apt packages already installed."
fi

# fd is installed as fdfind on Debian/Ubuntu — expose it as fd
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    mkdir -p ~/.local/bin
    ln -sf "$(command -v fdfind)" ~/.local/bin/fd
fi

# --- Neovim (latest stable from GitHub releases; apt version is too old for LazyVim) ---
if ! command -v nvim &>/dev/null; then
    echo "Installing Neovim..."
    NVIM_TMP=$(mktemp -d)
    NVIM_URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest \
        | grep '"browser_download_url"' \
        | grep 'nvim-linux.*\.tar\.gz"' \
        | grep -v sha256 \
        | head -1 \
        | cut -d'"' -f4)
    if [ -z "$NVIM_URL" ]; then
        echo "ERROR: Could not determine Neovim download URL." >&2
        rm -rf "$NVIM_TMP"
        exit 1
    fi
    TARBALL="$(basename "$NVIM_URL")"
    EXTRACT_DIR="${TARBALL%.tar.gz}"
    curl -fsSL "$NVIM_URL" -o "$NVIM_TMP/$TARBALL"
    tar xf "$NVIM_TMP/$TARBALL" -C "$NVIM_TMP"
    mkdir -p ~/.local
    rm -rf ~/.local/nvim
    mv "$NVIM_TMP/$EXTRACT_DIR" ~/.local/nvim
    mkdir -p ~/.local/bin
    ln -sf ~/.local/nvim/bin/nvim ~/.local/bin/nvim
    rm -rf "$NVIM_TMP"
    echo "Neovim installed to ~/.local/nvim"
else
    echo "Neovim already installed: $(nvim --version | head -1)"
fi
