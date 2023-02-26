local options = {
  mouse = "a", -- mouse support
  number = true, -- number lines
  relativenumber = true, -- relative number lines
  ignorecase = true, -- search case insensitive
  smartcase = true, -- case sensitive when search query contains uppercase
  tabstop = 2, -- number of visual spaces per TAB
  shiftwidth = 2, -- number of spaces to use for autoindent
  softtabstop = 2, -- numbers of spaces to use for autoindent
  expandtab = true, -- tabs are spaces
  shiftround = true, -- round to nearest shiftwidth, applies to < > commands
  smartindent = true,
  smarttab = true,
  autoindent = true,
  copyindent = true, -- copy indent from the previous line
  completeopt = { "menu", "menuone", "noselect" },
  termguicolors = true,
  swapfile = false,
  compatible = false,
  splitright = false,
  laststatus = 0,
  shell = "/bin/bash", -- set shell
  updatetime = 50,
  ruler = false,
  showmode = false, -- insert, visual mode message on the last line
  showcmd = false,
  undofile = true,
  wrap = false,
}
vim.g.mapleader = " "

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.api.nvim_command("syntax on")
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
-- vim.wo.fillchars = 'eob: ' -- disable '~' blank lines
vim.opt.fillchars:append('eob: ')
