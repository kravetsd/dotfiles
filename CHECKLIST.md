# Setup Checklist

Tracks progress on [issue #5](https://github.com/kravetsd/agentic-engineering-roadmap-pocock/issues/5).

## Phase 1 — Local Windows (WezTerm)

- [x] Install WezTerm on Windows
- [x] Install a Nerd Font (e.g. JetBrainsMono Nerd Font) and set it in WezTerm
- [x] Enable OSC 52 clipboard passthrough in WezTerm Lua config
- [x] Add WezTerm config to this repo via chezmoi

## Phase 2 — chezmoi bootstrap

- [x] Install chezmoi on local machine
- [x] Run `chezmoi init` pointing to this repo
- [x] Install chezmoi on each remote machine
- [x] Verify `chezmoi apply` produces identical config on a fresh remote

## Phase 3 — Remote: tmux

- [x] Install tmux on all remote machines
- [x] Write tmux config (named sessions, sane prefix, status bar)
- [x] Add tmux config to this repo via chezmoi
- [x] Verify session survives SSH disconnect and reattach on all 3 machines

## Phase 4 — Remote: Neovim + LazyVim

- [x] Run `vimtutor` (do this before any Neovim config work)
- [x] Install Neovim on all remote machines (`chezmoi apply` now handles this via `run_once_install-packages.sh`)
- [x] Install LazyVim (first `nvim` launch auto-installs all plugins — run `nvim` and wait)
- [x] Add LazyVim config to this repo via chezmoi (`dot_config/nvim/`)

## Phase 5 — LSPs via mason.nvim

- [x] pyright (Python) — via `lazyvim.plugins.extras.lang.python`
- [x] ruff (Python linting) — via `lazyvim.plugins.extras.lang.python`
- [x] yaml-language-server (YAML) — via `lazyvim.plugins.extras.lang.yaml`
- [x] bash-language-server (Bash) — manual mason config in `lang.lua`
- [x] terraform-ls (Terraform) — via `lazyvim.plugins.extras.lang.terraform`
- [x] dockerfile-language-server (Dockerfile) — via `lazyvim.plugins.extras.lang.docker`
- [x] gopls (Go) — via `lazyvim.plugins.extras.lang.go`
- [x] jsonls (JSON) — via `lazyvim.plugins.extras.lang.json`
- [x] marksman (Markdown) — via `lazyvim.plugins.extras.lang.markdown`

## Phase 6 — lazygit

- [x] Install lazygit on all remote machines (`chezmoi apply` now handles this via `run_once_install-packages.sh`)
- [x] Confirm lazygit.nvim float integration (ships with LazyVim — no extra config needed)
- [x] Verify lazygit opens from Neovim keybinding and shows branch history

## Phase 7 — Verification (manual)

- [x] OSC 52: copy from remote Neovim → paste into local Windows browser
- [x] OSC 52: copy from local Windows clipboard → paste into remote Neovim (via Ctrl+V in WezTerm)
- [x] All 8 LSPs show diagnostics on a file of the relevant type
- [x] WezTerm renders Nerd Font glyphs without tofu characters
- [x] `chezmoi apply` on a fresh remote produces identical config — verified manually on a fresh VM; Docker-based automated test tracked in [#2](https://github.com/kravetsd/dotfiles/issues/2)
