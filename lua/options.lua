local options = {
  mouse = "a", -- mouse support
  number = true, -- number lines
  ignorecase = true, -- search case insensitive
  tabstop = 2, -- number of visual spaces per TAB
  shiftwidth = 2, -- number of spaces to use for autoindent
  softtabstop = 2, -- numbers of spaces to use for autoindent
  expandtab = true, -- tabs are spaces
  smartindent = true,
  smarttab = true,
  autoindent = true,
  copyindent = true, -- copy indent from the previous line
  completeopt = { "menu", "menuone", "noselect" },
  termguicolors = true,
  swapfile = false,
  compatible = false,
  clipboard = "unnamedplus",
  splitright = false,
  -- shortmess = 'I',
  cmdheight = 0,
}
for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.api.nvim_command("syntax on")

vim.g.gruvbox_italics = 0
vim.g.gruvbox_italicize_strings = 0
vim.cmd [[
    try
        colorscheme gruvbox8
    catch /^Vim\%((\a\+)\)\=:E18/
        colorscheme default
        set background=dark
]]
