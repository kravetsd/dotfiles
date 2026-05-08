#!/bin/bash
# Runs once per machine (re-runs if this file changes).
# Installs all required system packages for the terminal dev environment.
set -e

packages=(tmux)
to_install=()

for pkg in "${packages[@]}"; do
    if ! command -v "$pkg" &>/dev/null; then
        to_install+=("$pkg")
    fi
done

if [ ${#to_install[@]} -gt 0 ]; then
    echo "Installing: ${to_install[*]}"
    sudo apt-get update -qq
    sudo apt-get install -y "${to_install[@]}"
else
    echo "All packages already installed."
fi
