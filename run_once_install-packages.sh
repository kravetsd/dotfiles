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

# --- Node.js LTS (needed by mason.nvim for: pyright, yaml-ls, bash-ls, dockerfile-ls, jsonls) ---
if ! command -v node &>/dev/null; then
    echo "Installing Node.js LTS..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "Node.js already installed: $(node --version)"
fi

# --- lazygit (latest stable from GitHub releases) ---
if ! command -v lazygit &>/dev/null; then
    echo "Installing lazygit..."
    LG_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest \
        | grep '"tag_name"' | cut -d'"' -f4 | sed 's/^v//')
    case "$(uname -m)" in
        x86_64)        LG_ARCH="x86_64" ;;
        aarch64|arm64) LG_ARCH="arm64" ;;
        *) echo "ERROR: Unsupported architecture: $(uname -m)" >&2; exit 1 ;;
    esac
    LG_TMP=$(mktemp -d)
    curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${LG_VERSION}/lazygit_${LG_VERSION}_Linux_${LG_ARCH}.tar.gz" \
        -o "$LG_TMP/lazygit.tar.gz"
    tar xf "$LG_TMP/lazygit.tar.gz" -C "$LG_TMP"
    mkdir -p ~/.local/bin
    mv "$LG_TMP/lazygit" ~/.local/bin/lazygit
    rm -rf "$LG_TMP"
    echo "lazygit installed to ~/.local/bin/lazygit"
else
    echo "lazygit already installed: $(lazygit --version | head -1)"
fi

# --- Neovim (latest stable from GitHub releases; apt version is too old for LazyVim) ---
if ! command -v nvim &>/dev/null; then
    echo "Installing Neovim..."
    case "$(uname -m)" in
        x86_64)        ARCH_PAT="nvim-(linux64|linux-x86_64)\.tar\.gz" ;;
        aarch64|arm64) ARCH_PAT="nvim-linux-arm64\.tar\.gz" ;;
        *)
            echo "ERROR: Unsupported architecture: $(uname -m)" >&2
            exit 1
            ;;
    esac
    NVIM_TMP=$(mktemp -d)
    NVIM_URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest \
        | grep '"browser_download_url"' \
        | grep -v sha256 \
        | grep -E "$ARCH_PAT" \
        | head -1 \
        | cut -d'"' -f4)
    if [ -z "$NVIM_URL" ]; then
        echo "ERROR: Could not find Neovim release for $(uname -m)." >&2
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
