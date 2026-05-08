# dotfiles

Personal dotfiles managed by [chezmoi](https://www.chezmoi.io/).

Terminal stack: **WezTerm** (Windows) → SSH → **tmux** → **Neovim + LazyVim** on remote Linux machines.

## Bootstrap a new remote Linux machine

One command installs chezmoi, applies all dotfiles, and installs required packages:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/kravetsd/dotfiles/main/linux/bootstrap.sh)
```

## Windows setup

See [windows/SETUP.md](windows/SETUP.md) for WezTerm, Nerd Font, and chezmoi setup on Windows.

## Updating dotfiles on any machine

```bash
chezmoi update
```

## What's managed

| File | Target | Machine |
|------|--------|---------|
| `dot_wezterm.lua` | `~/.wezterm.lua` | Windows only |
| `dot_tmux.conf` | `~/.tmux.conf` | Linux |
