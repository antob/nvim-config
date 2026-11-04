return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.globalstatus = true
    opts.options.component_separators = " ⃒"
    opts.options.section_separators = ""

    -- Show the full file path when the window is wide enough,
    -- otherwise fall back to LazyVim's shortened path.
    local full_path = LazyVim.lualine.pretty_path({ length = 0 })
    local short_path = LazyVim.lualine.pretty_path()
    opts.sections.lualine_c[4] = {
      function(self)
        if vim.o.columns >= 160 then
          return full_path(self)
        end
        return short_path(self)
      end,
    }

    -- Replace the clock with progress/location
    opts.sections.lualine_z = opts.sections.lualine_y
    opts.sections.lualine_y = {}
  end,
}
