# Setup Checklist

Tracks progress on [issue #5](https://github.com/kravetsd/agentic-engineering-roadmap-pocock/issues/5).

## Phase 1 — Local Windows (WezTerm)

- [ ] Install WezTerm on Windows
- [ ] Install a Nerd Font (e.g. JetBrainsMono Nerd Font) and set it in WezTerm
- [ ] Enable OSC 52 clipboard passthrough in WezTerm Lua config
- [ ] Add WezTerm config to this repo via chezmoi

## Phase 2 — chezmoi bootstrap

- [ ] Install chezmoi on local machine
- [ ] Run `chezmoi init` pointing to this repo
- [ ] Install chezmoi on each remote machine
- [ ] Verify `chezmoi apply` produces identical config on a fresh remote

## Phase 3 — Remote: tmux

- [ ] Install tmux on all remote machines
- [ ] Write tmux config (named sessions, sane prefix, status bar)
- [ ] Add tmux config to this repo via chezmoi
- [ ] Verify session survives SSH disconnect and reattach on all 3 machines

## Phase 4 — Remote: Neovim + LazyVim

- [ ] Run `vimtutor` (do this before any Neovim config work)
- [ ] Install Neovim on all remote machines
- [ ] Install LazyVim
- [ ] Add LazyVim config to this repo via chezmoi

## Phase 5 — LSPs via mason.nvim

- [ ] pyright (Python)
- [ ] ruff (Python linting)
- [ ] yaml-language-server (YAML)
- [ ] bash-language-server (Bash)
- [ ] terraform-ls (Terraform)
- [ ] dockerfile-language-server (Dockerfile)
- [ ] gopls (Go)
- [ ] jsonls (JSON)
- [ ] marksman (Markdown)

## Phase 6 — lazygit

- [ ] Install lazygit on all remote machines
- [ ] Confirm lazygit.nvim float integration (ships with LazyVim)
- [ ] Verify lazygit opens from Neovim keybinding and shows branch history

## Phase 7 — Verification (manual)

- [ ] OSC 52: copy from remote Neovim → paste into local Windows browser
- [ ] OSC 52: copy from local Windows clipboard → paste into remote Neovim
- [ ] All 8 LSPs show diagnostics on a file of the relevant type
- [ ] WezTerm renders Nerd Font glyphs without tofu characters
- [ ] `chezmoi apply` on a fresh remote produces identical config
