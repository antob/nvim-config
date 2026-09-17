-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

-- Use the 68k asm syntax variant.
vim.g.asmsyntax = "asm68k"

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
