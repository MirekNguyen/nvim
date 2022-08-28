-- require('nvim-autopairs').setup {}
require('luasnip.loaders.from_vscode').lazy_load()
require('indent_blankline').setup {
  show_current_context = true,
  show_current_context_start = true,
}
require('impatient').enable_profile()
require('gitsigns').setup()
require('nvim-gps').setup()
require('Comment').setup()
require('trouble').setup()
require('numb').setup()
require('diffview').setup()
require('colorizer').setup({ '*'; })
