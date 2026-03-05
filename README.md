# My Dotfiles (chezmoi)

This repo is now managed with [chezmoi](https://www.chezmoi.io/) and designed to work across Windows and Linux.

## Install on a new machine

1. Install chezmoi.
2. Apply this repo:

```powershell
chezmoi init --apply damirparipovic
```

## Daily workflow

```powershell
chezmoi status
chezmoi diff
chezmoi apply
```

## Notes

- Canonical Neovim config comes from `%LOCALAPPDATA%\nvim` and is stored under `dot_config/nvim`.
- Linux-specific shell files remain in the repo but are excluded on Windows via `.chezmoiignore`.
