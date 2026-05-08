# dotfiles

Personal dotfiles managed by [chezmoi](https://www.chezmoi.io/).

## Roadmap issue

[#5 — Switch from VS Code to WezTerm + tmux + Neovim terminal dev environment on remote machines](https://github.com/kravetsd/agentic-engineering-roadmap-pocock/issues/5)

## Problem Statement

VS Code over remote-SSH drops session context on SSH disconnection, adds latency, and requires manual per-machine sync. This repo replaces that with a resilient, portable terminal environment that survives disconnections and bootstraps any new remote machine in a single command.

## Implementation Decisions

- **WezTerm** — Windows terminal emulator, OSC 52 clipboard passthrough, Nerd Font
- **tmux** — session persistence on remote Linux machines
- **Neovim + LazyVim** — IDE on remote, LSP via mason.nvim, lazygit integration
- **chezmoi** — single source of truth, machine-specific overrides via templates

## Testing Decisions

- `tmux attach` restores exact session state after SSH disconnect on all 3 remote machines
- `chezmoi apply` produces identical config on a fresh remote machine from this repo
- OSC 52 clipboard round-trip works both directions (remote Neovim ↔ local Windows)
- All 8 LSPs show diagnostics on a file of the relevant type
- `lazygit` opens from Neovim keybinding
- WezTerm renders Nerd Font glyphs without tofu

## Out of Scope

- nvim-dap or any graphical debugger
- WezTerm as a multiplexer (tmux owns that layer)
- Building Neovim config from scratch (LazyVim is the base)
- Inline AI completion plugins
- Windows-side tooling changes beyond WezTerm config
