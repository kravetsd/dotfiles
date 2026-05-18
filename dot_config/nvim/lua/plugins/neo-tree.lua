return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    })
  end,
}
