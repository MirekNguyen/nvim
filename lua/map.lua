local function nmap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

local function vmap(shortcut, command)
  vim.api.nvim_set_keymap("v", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

-- normal
nmap("<leader>yy", "\"+yy")
nmap("<leader>Y", "\"+Y")
nmap("<leader>dd", "\"+dd")
nmap("<leader>p", "\"+p")
nmap("<leader>P", "\"+P")

-- visual
vmap("<leader>y", "\"+y")
vmap("<leader>d", "\"+d")
vmap("<leader>p", "\"+p")
vmap("<leader>P", "\"+P")

-- NvimTree
nmap("<leader>k", ":NvimTreeToggle")
-- Telescope
nmap("<leader>f", ":Telescope find_files");
nmap("<leader>j", ":Telescope live_grep");
nmap("<leader>g", ":lua require'telescope.builtin'.git_files{}");
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

nmap("ga", ":Lspsaga code_action")
nmap("gf", ":Lspsaga lsp_finder")
nmap("K", ":Lspsaga hover_doc")
nmap("L", ":Lspsaga peek_definition")
nmap("gr", ":Lspsaga rename")
nmap("go", ":Lspsaga outline")
nmap("gd", ":Lspsaga goto_definition")
nmap("<leader>l", ":UndotreeToggle")
nmap("<leader>s", ":Gitsigns toggle_signs")
nmap("<leader>S", ":Gitsigns preview_hunk_inline")
nmap("<leader>w", ":lua vim.lsp.buf.format()")

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
