return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Filetypes with no formatter configured: use the LSP if one can format,
        -- otherwise at least trim trailing whitespace and blank lines.
        ["_"] = function(bufnr)
          if #vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/formatting" }) > 0 then
            return {}
          end
          return { "trim_whitespace", "trim_newlines" }
        end,
      },
    },
  },
}
