return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ruby_lsp already runs rubocop internally; avoids duplicate diagnostics
        rubocop = { enabled = false },
      },
    },
  },
}
