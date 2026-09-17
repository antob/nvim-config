local highlight_overrides = require("plugins.colorscheme.hl_overrides")

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    event = "LazyFile",
    opts = {
      transparent_background = true,
      float = {
        transparent = true, -- enable transparent floating windows
        -- solid = false, -- use solid styling for floating windows, see |winborder|
      },
      color_overrides = {
        all = {
          dark_purple = "#c7a0dc",
          sun = "#ffe9b6",
          vibrant_green = "#b6f4be",
        },
      },
      -- TODO: use custom_highlights
      custom_highlights = {},
      highlight_overrides = highlight_overrides,
    },
  },
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
}
