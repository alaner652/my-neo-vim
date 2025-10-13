# Neovim Configuration

> Modern Neovim config with VSCode-style keybindings, LSP, and auto-formatting

## Features

- VSCode-style keybindings (Ctrl+S, Ctrl+P, Alt+1-9, etc.)
- LSP support for multiple languages
- Auto-formatting on save
- GitHub Copilot integration
- File tree (Neo-tree) and fuzzy finder (Telescope)
- Beautiful UI with Catppuccin theme

## Installation

### Requirements

```bash
# macOS
brew install neovim ripgrep fd node

# Install Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Setup

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone <your-repo> ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

## Key Bindings

### File Operations
- `Ctrl+S` - Save
- `Ctrl+W` - Close buffer
- `Ctrl+Q` - Quit
- `Ctrl+P` - Find files
- `Ctrl+B` - Toggle file tree

### Editing
- `Ctrl+A` - Select all
- `Ctrl+Z` / `Ctrl+Y` - Undo/Redo
- `Ctrl+/` or `Space+/` - Toggle comment
- `Space+F` - Format file

### Navigation
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show documentation
- `Space+ca` - Code actions
- `F2` - Rename symbol

### Tabs (Bufferline)
- `Alt+,` / `Alt+.` - Previous/Next tab
- `Alt+1-9` - Jump to tab 1-9
- `Alt+C` - Close tab
- `Alt+P` - Pin tab

### Search
- `Space+sg` - Global search
- `Space+sc` - Command palette
- `Space+bb` - Switch buffer

## Supported Languages

### LSP Servers (auto-installed)
- Lua, TypeScript/JavaScript, HTML, CSS, JSON
- C/C++, Java, Python

### Formatters (auto-installed)
- Prettier (JS/TS/HTML/CSS/JSON/Markdown)
- stylua (Lua)
- black (Python)
- clang-format (C/C++)

## Common Commands

```vim
:Lazy              " Plugin manager
:Mason             " LSP/formatter manager
:Copilot auth      " Setup GitHub Copilot
:checkhealth       " Check Neovim health
```

## Directory Structure

```
~/.config/nvim/
├── .gitignore
├── init.lua
├── README.md
└── lua/
    ├── config/
    │   ├── lazy.lua      # Plugin manager
    │   └── keymaps.lua   # Keybindings
    └── plugins/          # Plugin configs
```

## Tips

- Press `Space` to see available keybindings
- Auto-format on save is enabled by default
- Use `Space+F` to manually format
- Use `Alt+P` to pin frequently used files
- Press `?` in Neo-tree for all file tree commands

## Troubleshooting

**Icons not showing?** Install a Nerd Font and set it in your terminal.

**LSP not working?** Check `:Mason` to ensure servers are installed.

**Copilot not working?** Run `:Copilot auth` to authenticate.

---

Made with ❤️ for developers who love VSCode keybindings
