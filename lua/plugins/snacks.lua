return {
  {
    "folke/snacks.nvim",
    optional = true,
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
    },
  },
}
