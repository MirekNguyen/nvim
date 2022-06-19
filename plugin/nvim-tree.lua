require('nvim-tree').setup {
   diagnostics = {
      enable = true,
      show_on_dirs = true,
   },
   renderer = {
      add_trailing = true,
      group_empty = true,
      highlight_git = true,
   },
   update_focused_file = {
      enable = true,
      update_cwd = true,
   },
}
