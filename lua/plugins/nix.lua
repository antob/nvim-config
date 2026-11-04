return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      nil_ls = {
        settings = {
          ["nil"] = {
            -- Fetch missing flake inputs automatically instead of prompting
            nix = { flake = { autoArchive = true } },
          },
        },
      },
    },
  },
}
