-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

-- Hide LSP symbol breadcrumbs (trouble.nvim) in lualine
vim.g.trouble_lualine = false

-- Use the 68k asm syntax variant.
vim.g.asmsyntax = "asm68k"

-- Disable tabline
vim.g.showtabline = 0

-- Enable LSP servers
vim.lsp.enable({
  "m68k",
})

-- Configure LSP servers
-- m68k-lsp-server
vim.lsp.config("m68k", {
  init_options = {
    format = {
      case = {
        instruction = "lower",
        directive = "upper",
        control = "upper",
        sectionType = "upper",
        register = "lower",
        hex = "lower",
      },
      finalNewLine = true,
    },
  },
})
