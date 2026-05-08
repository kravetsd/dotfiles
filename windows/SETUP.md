# Windows Setup

Steps to configure the Windows side of the dev environment. Run these once on your Windows machine.

## 1. Install WezTerm

Download and run the installer from the [WezTerm releases page](https://github.com/wez/wezterm/releases/latest).
Pick the `WezTerm-windows-<version>.exe` asset.

## 2. Install JetBrainsMono Nerd Font

Run the PowerShell script in this directory. No admin rights needed — installs to your user fonts folder.

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\windows\install-nerd-font.ps1
```

Restart WezTerm after the script completes.

## 3. Install chezmoi and apply dotfiles

Install chezmoi via winget (run in Git Bash or PowerShell):

```powershell
winget install twpayne.chezmoi
```

Then initialise chezmoi from this repo and apply in one step:

```bash
chezmoi init --apply https://github.com/kravetsd/dotfiles.git
```

This clones the repo into `~/.local/share/chezmoi` and copies `dot_wezterm.lua` to `~/.wezterm.lua`.
Restart WezTerm — it will pick up the config automatically.

For future config changes, pull and reapply with:

```bash
chezmoi update
```
