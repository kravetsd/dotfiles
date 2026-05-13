return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_c, {
      function()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
      end,
      icon = "",
    })
    return opts
  end,
}
