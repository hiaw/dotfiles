# AGENTS.md - Dotfiles Repository Guidelines

## Build/Lint/Test Commands
- Install dotfiles: `zsh ~/.dotfiles/install.zsh`
- Format Lua (Neovim): `stylua .`
- Format JavaScript/TypeScript/Markdown: `prettier --write .`
- Lint Markdown: `markdownlint-cli2 --config runcom/markdownlint-cli2.jsonc`
- Test in Neovim: Use `:Neotest` for running tests (Jest, Python test adapters available)

## Code Style Guidelines
- **Lua formatting**: 2 spaces, 120 column width (stylua.toml)
- **JavaScript/TypeScript**: No semicolons (prettierrc config)
- **File organization**: Config files in `config/`, shell scripts in `runcom/`, installation in `install/`
- **Naming**: Use kebab-case for config files, snake_case for Lua files
- **Symlinks**: Install script creates symlinks from dotfiles to home directory
- **Comments**: Use shell-style `#` comments in shell scripts, `--` in Lua

## Repository Structure
- `config/`: Application configurations (nvim, kitty, zellij)
- `runcom/`: Shell runtime configuration files
- `git/`: Git configuration files
- `zsh/`: Zsh shell configuration
- `install/`: Installation scripts and package lists
- `other/`: Utility scripts

This is a personal dotfiles repository for macOS/Linux development environment setup.