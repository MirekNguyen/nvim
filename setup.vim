lua << EOF
require('nvim-autopairs').setup{}
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
require("toggleterm").setup{}
require("impatient").enable_profile()
EOF
