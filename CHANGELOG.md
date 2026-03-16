# Changelog

## 2026-03-15

### Added
- Neovim config (`.config/nvim/`) with lazy.nvim, telescope, treesitter, native LSP, conform.nvim, lualine, gitsigns, oil.nvim, catppuccin frappe colorscheme
- Ghostty terminal config (`.config/ghostty/`) with Catppuccin Frappe theme, split management keybindings, copy-on-select, macos-option-as-alt
- Starship prompt config (`.config/starship.toml`) with Catppuccin Frappe palette, git/node/gcloud/terraform modules

### Changed
- `.tmux.conf`: added `xterm-ghostty` terminal overrides for true color, changed `vim` references to `nvim`
- `.zshrc`: set `EDITOR=nvim`, added `alias vim=nvim`, added starship prompt init, disabled oh-my-zsh theme, removed `TERM=xterm-256color` override
- `.zshrc`: replaced nvm with mise for Node.js version management (auto-switches on `cd` via `.nvmrc` files)
