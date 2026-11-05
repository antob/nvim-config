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

      -- Noice drops a confirm message when it's identical to the previous one,
      -- so asking the same question twice shows only "[Y]es, (N)o, (C)ancel".
      -- Reset its duplicate check before each confirm.
      local Msg = require("noice.ui.msg")
      local State = require("noice.ui.state")
      local on_confirm = Msg.on_confirm
      Msg.on_confirm = function(event, ...)
        State.clear(event)
        return on_confirm(event, ...)
      end
    end,
  },
}
