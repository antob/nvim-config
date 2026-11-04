return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.cmdline = vim.tbl_deep_extend("force", opts.cmdline or {}, {
        view = "cmdline",
      })

      -- Pyright starts a new (untitled) progress for every re-analysis, which
      -- stacks up "✔ pyright" messages on each keystroke. Hide them.
      opts.routes = opts.routes or {}
      table.insert(opts.routes, {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            return vim.tbl_get(message.opts, "progress", "client") == "pyright"
          end,
        },
        opts = { skip = true },
      })
    end,
  },
}
