-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- formatting
map({ "n", "x" }, "=", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- windows
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Redo remap
map("n", "U", "<C-r>", { desc = "Redo" })
