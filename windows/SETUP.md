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

## 3. Apply WezTerm config

Once chezmoi is set up (Phase 2 of the checklist), run:

```powershell
chezmoi apply
```

This copies `dot_wezterm.lua` from the repo to `~/.wezterm.lua`, which WezTerm loads automatically on startup.

Until chezmoi is configured, you can apply it manually:

```powershell
Copy-Item dot_wezterm.lua "$env:USERPROFILE\.wezterm.lua"
```
