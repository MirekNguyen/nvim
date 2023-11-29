local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- normal
map("n", "<leader>yy", "\"+yy")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>dd", "\"+dd")
map("n", "<leader>p", "\"+p")
map("n", "<leader>P", "\"+P")

-- visual
map("v", "<leader>y", "\"+y")
map("v", "<leader>d", "\"+d")
map("v", "<leader>p", "\"+p")
map("v", "<leader>P", "\"+P")

-- NvimTree
map("n", "<leader>k", ":NvimTreeToggle<CR>")
-- Telescope
map("n", "<leader>f", ":Telescope find_files<CR>");
map("n", "<leader>j", ":Telescope live_grep<CR>");
map("n", "<D-j>", ":Telescope telescope_path<CR>");
map("n", "<D-k>", ":lua require'telescope.builtin'.git_files{show_untracked=true}<CR>");
-- Barbar
map("n", "<A-[>", ":BufferPrevious<CR>")
map("n", "<A-]>", ":BufferNext<CR>")
-- Goto buffer in position...
map("n", "<leader>1", ":BufferGoto 1<CR>")
map("n", "<leader>2", ":BufferGoto 2<CR>")
map("n", "<leader>3", ":BufferGoto 3<CR>")
map("n", "<leader>4", ":BufferGoto 4<CR>")
map("n", "<leader>5", ":BufferGoto 5<CR>")
map("n", "<leader>6", ":BufferGoto 6<CR>")
map("n", "<leader>7", ":BufferGoto 7<CR>")
map("n", "<leader>8", ":BufferGoto 8<CR>")
map("n", "<leader>9", ":BufferLast")
-- Pin/unpin buffer
map("n", "<C-p>", ":BufferPin<CR>")
-- Close buffer
map("n", "<leader>q", ":BufferClose<CR>")
-- Magic buffer-picking mode
map("n", "<C-s>", ":BufferPick<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "ga", ":Lspsaga code_action<CR>")
map("n", "gf", ":Lspsaga finder<CR>")
map("n", "K", ":Lspsaga hover_doc ++keep<CR>")
map("n", "L", ":Lspsaga peek_definition<CR>")
map("n", "gr", ":Lspsaga rename<CR>")
map("n", "go", ":Lspsaga outline<CR>")
map("n", "gd", ":Lspsaga goto_definition<CR>")
map("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
map("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
map("n", "<leader>l", ":UndotreeToggle<CR>")
map("n", "<leader>s", ":Gitsigns toggle_signs<CR>")
map("n", "<leader>S", ":Gitsigns preview_hunk_inline<CR>")
map("n", "<leader>w", ":lua vim.lsp.buf.format()<CR>")

map("n", "<leader>a", "<C-w>w")

map("n", "<D-o>", ":ChatGPT<CR>")

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
