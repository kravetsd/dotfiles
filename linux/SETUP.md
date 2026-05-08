# Linux Remote Machine Setup

Run this once on each remote machine. A single command installs chezmoi and applies all dotfiles from this repo.

## Bootstrap (one command)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/kravetsd/dotfiles.git
```

This will:
1. Install the `chezmoi` binary to `~/.local/bin/`
2. Clone this repo into `~/.local/share/chezmoi`
3. Apply all dotfiles appropriate for Linux (WezTerm config is skipped automatically)

Make sure `~/.local/bin` is on your `PATH`. Add to `~/.bashrc` if needed:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Updating dotfiles

After the initial bootstrap, pull and reapply with:

```bash
chezmoi update
```
