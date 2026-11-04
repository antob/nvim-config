return {
  {
    "folke/snacks.nvim",
    optional = true,
    opts = {
      picker = {
        actions = {
          -- grep inside the selected files, or all files in the filtered list
          grep_selected = function(picker)
            local opts = { hidden = picker.opts.hidden, ignored = picker.opts.ignored }
            if #picker:selected() == 0 and picker.input.filter:is_empty() then
              -- no filter: grep the whole cwd instead of passing every file to rg
              picker:close()
              Snacks.picker.grep(vim.tbl_extend("force", opts, { cwd = picker:cwd() }))
              return
            end
            local items = picker:selected()
            if #items == 0 then
              items = picker:items()
            end
            if #items == 0 then
              return Snacks.notify.warn("No files to grep")
            end
            local files = vim.tbl_map(Snacks.picker.util.path, items)
            picker:close()
            Snacks.picker.grep(vim.tbl_extend("force", opts, {
              dirs = files,
              title = ("Grep (%d files)"):format(#files),
            }))
          end,
        },
        win = {
          input = {
            keys = {
              ["<a-g>"] = { "grep_selected", mode = { "n", "i" } },
            },
          },
          list = {
            keys = {
              ["<a-g>"] = "grep_selected",
            },
          },
        },
      },
    },
  },
}
