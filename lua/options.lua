local options = {
  mouse = "a", -- mouse support
  number = true, -- number lines
  relativenumber = true, -- relative number lines
  ignorecase = true, -- search case insensitive
  smartcase = true, -- case sensitive when search query contains uppercase
  shiftround = true, -- round to nearest shiftwidth, applies to < > commands
  shiftwidth = 2, -- number of spaces to use for autoindent
  tabstop = 2, -- number of visual spaces per TAB
  softtabstop = 2, -- number of visual spaces per new line
  expandtab = true, -- tabs are spaces
  smartindent = true, -- automatic indentation for new lines based on syntax
  copyindent = true, -- copy indent from the previous line
  completeopt = { "menu", "menuone", "noselect" }, -- for completion plugin
  termguicolors = true,
  swapfile = false, -- store unsaved changes in a file
  shell = "/bin/bash", -- set shell
  updatetime = 50,
  undofile = true,
  wrap = false,
  laststatus = 0,
  ruler = false,
  showmode = false, -- insert, visual mode message on the last line
  showcmd = false, -- show last pressed keys in status line
  fillchars = 'eob: ', -- disable '~' blank lines
  writebackup = false,
  backup = false,
  title = true,
  titlestring='%t',
  splitright = true, -- vertical split to the right
  -- cmdheight = 0, -- cmdline height
}
local global_options = {
  -- loaded_python3_provider = 0,
  loaded_ruby_provider = 0,
  loaded_node_provider = 0,
  loaded_perl_provider = 0,
  mapleader = " ",
}

vim.lsp.set_log_level("off")
for key, value in pairs(options) do
  vim.opt[key] = value
end

for key, value in pairs(global_options) do
  vim.g[key] = value
end
