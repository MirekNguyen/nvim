local function nmap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

-- NvimTree
nmap("<C-h>", ":NvimTreeFindFile")
nmap("<C-n>", ":NvimTreeToggle")
nmap("<C-f>", ":NvimTreeFocus")
nmap("<C-k>", ":NvimTreeRefresh")
-- Telescope
nmap("ff", ":Telescope find_files");
nmap("fg", ":Telescope live_grep");
-- Floaterm
nmap("<A-j>", ":FloatermToggle")
-- nmap("<A-,>", ":ToggleTerm")
nmap("<A-z>", ":TroubleToggle")
vim.g.floaterm_keymap_toggle = "<A-j>"
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

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
