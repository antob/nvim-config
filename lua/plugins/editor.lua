local lazyvim_utils = require("lazyvim.util")

return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      {
        "<leader>o",
        "<cmd>Oil<CR>",
        desc = "Oil (Cwd)",
      },
      {
        "<leader>O",
        function()
          require("oil").open(lazyvim_utils.root())
        end,
        desc = "Oil (Root)",
      },
    },
    opts = {
      columns = {
        {
          "permissions",
          highlight = function(permission_str)
            local hls = {}
            local permission_hlgroups = {
              ["-"] = "OilHyphen",
              ["r"] = "OilRead",
              ["w"] = "OilWrite",
              ["x"] = "OilExecute",
            }
            for i = 1, #permission_str do
              local char = permission_str:sub(i, i)
              table.insert(hls, { permission_hlgroups[char], i - 1, i })
            end
            return hls
          end,
        },
        { "size", highlight = "OilSize" },
        { "mtime", highlight = "OilMtime" },
        {
          "icon",
          default_file = {
            default = "󰈚",
            symlink = "",
          },
          directory = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          add_padding = false,
        },
      },
      win_options = {
        signcolumn = "yes",
        cursorcolumn = true,
      },
      delete_to_trash = true,
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["q"] = { "actions.close", mode = "n" },
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",

        ["<C-v>"] = "actions.select_vsplit",
        ["<C-x>"] = "actions.select_split",
        ["<C-r>"] = "actions.refresh",
        ["go"] = "actions.open_external",
      },
      view_options = {
        show_hidden = true,
      },
    },
  },
}
