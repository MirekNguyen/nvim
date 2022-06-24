local options = {
   mouse = "a",
   number = true,
   ignorecase = true,
   shiftwidth = 3,
   tabstop = 3,
   softtabstop = 3,
   expandtab = true,
   smartindent = true,
   smarttab = true,
   completeopt = { "menu", "menuone", "noselect" },
   termguicolors = true,
   swapfile = false,
   compatible = false,
   clipboard = "unnamedplus",
   splitright = false,
}
for key, value in pairs(options) do
   vim.opt[key] = value
end

local function vcom(command)
   vim.api.nvim_command(command)
end

vcom("colorscheme gruvbox")
vcom("syntax on")

-- VSCode highlight
vcom("highlight link LspSagaFinderSelection Search")
vcom("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
vcom("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vcom("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")
vcom("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
vcom("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE")
vcom("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE")
vcom("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
vcom("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0")
vcom("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
vcom("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4")
vcom("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4")
