# nvim-config

Personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Features

- [LazyVim](https://github.com/LazyVim/LazyVim) base distribution with lazy-loaded plugins
- 68000 assembly development support:
  - Filetype detection for `.s` files (`asm68k`)
  - [m68k LSP server](https://github.com/niceguys-gmbh/m68k-lsp-server) integration with formatting options (lowercase instructions, uppercase directives, hex, etc.)
- KickAssembler (C64) syntax highlighting from `syntax/kickass.vim`
- [catppuccin](https://github.com/catppuccin/nvim) colorscheme with transparent background
- Plugin setup for:
  - [oil.nvim](https://github.com/stevearc/oil.nvim) file explorer with permissions/size/mtime columns, trash-safe deletes, and hidden files by default
  - [noice.nvim](https://github.com/folke/noice.nvim) with classic cmdline view
  - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) global statusline
  - [blink.cmp](https://github.com/Saghen/blink.cmp) with super-tab keymap; Enter inserts a newline, `<C-CR>` accepts
  - [conform.nvim](https://github.com/stevearc/conform.nvim) trimming whitespace and trailing newlines
  - [snacks.nvim](https://github.com/folke/snacks.nvim) picker with `<Esc>` to close
- Language extras: Copilot, Prettier, JSON, Markdown, Nix, Python, Ruby, Rust, SQL, TOML, TypeScript (+ TSC)
- Ruby: `rubocop` LSP disabled because `ruby_lsp` runs it internally, avoiding duplicate diagnostics
- Animations disabled (`mini.animate` disabled, `snacks_animate = false`)

## Requirements

- Neovim 0.9+ (uses `vim.lsp.enable` / `vim.lsp.config`)
- [lazy.nvim](https://github.com/folke/lazy.nvim), cloned automatically on first start
- [m68k-lsp-server](https://github.com/niceguys-gmbh/m68k-lsp-server) optional, only needed for 68000 assembly LSP features

## Installation

```sh
git clone https://github.com/antob/nvim-config.git ~/.config/nvim
nvim
```

Run `:Lazy` in Neovim to manage plugins.

## Layout

```
init.lua                 bootstrap entry point
lua/config/lazy.lua      lazy.nvim setup and plugin performance options
lua/config/options.lua   Neovim options (m68k LSP config)
lua/config/keymaps.lua   custom keymaps
lua/config/autocmds.lua  custom autocommands
lua/plugins/*.lua        plugin specifications
ftdetect/m68k.vim        .s -> asm68k filetype detection
syntax/kickass.vim       KickAssembler syntax highlighting
```

## Custom keymaps

| Key         | Action                                 |
| ----------- | -------------------------------------- |
| `=`         | Format buffer (normal and visual mode) |
| `<leader>\` | Split window right                     |
| `U`         | Redo                                   |

