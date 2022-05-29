lua << EOF
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
require('nvim-autopairs').setup{}
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
EOF
