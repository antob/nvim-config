return {
  "saghen/blink.cmp",
  optional = true,
  opts = {
    keymap = {
      preset = "super-tab", -- "default", "super-tab", or "enter" if you prefer
      ["<CR>"] = {}, -- unmap Enter (so it just inserts a newline)
      -- Optional: keep <C-CR> for accepting if you want
      ["<C-CR>"] = { "accept", "fallback" },
    },
    -- Optional: don't auto-select the first item
    completion = {
      list = {
        selection = { preselect = false },
      },
    },
  },
}
