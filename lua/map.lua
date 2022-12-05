local function nmap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

local function vmap(shortcut, command)
  vim.api.nvim_set_keymap("v", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

vmap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")
vmap("<leader>d", "\"+d")
nmap("<leader>dd", "\"+dd")
nmap("<leader>p", "\"+p")
nmap("<leader>P", "\"+P")

-- NvimTree
nmap("<leader>k", ":NvimTreeToggle")
-- Telescope
nmap("<leader>f", ":Telescope find_files");
nmap("<leader>j", ":Telescope live_grep");
-- Barbar
nmap("<A-[>", ":BufferPrevious")
nmap("<A-]>", ":BufferNext")
-- Goto buffer in position...
nmap("<A-1>", ":BufferGoto 1")
nmap("<A-2>", ":BufferGoto 2")
nmap("<A-3>", ":BufferGoto 3")
nmap("<A-4>", ":BufferGoto 4")
nmap("<A-5>", ":BufferGoto 5")
nmap("<A-6>", ":BufferGoto 6")
nmap("<A-7>", ":BufferGoto 7")
nmap("<A-8>", ":BufferGoto 8")
nmap("<A-9>", ":BufferLast")
-- Pin/unpin buffer
nmap("<A-p>", ":BufferPin")
-- Close buffer
nmap("<A-w>", ":BufferClose")
-- Magic buffer-picking mode
nmap("<A-s>", ":BufferPick")
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
