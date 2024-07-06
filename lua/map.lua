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

-- Oil
map("n", "<leader>k", ":Oil<CR>")

-- Telescope
-- map("n", "<leader>f", ":Telescope find_files<CR>");
map("n", "<leader>g", ":Telescope live_grep<CR>");
map("n", "<leader>b", ":Telescope buffers<CR>");
map("n", "<D-j>", ":Telescope telescope_path<CR>");
map("n", "<D-J>", ":Telescope telescope_path_forward<CR>");
map("n", "<D-l>", ":lua require'telescope.builtin'.git_files{show_untracked=true}<CR>");

map("n", "ga", ":Lspsaga code_action<CR>")
map("n", "gf", ":Lspsaga finder<CR>")
map("n", "K", ":Lspsaga hover_doc ++keep<CR>")
map("n", "L", ":Lspsaga peek_definition<CR>")
map("n", "gr", ":Lspsaga rename<CR>")
map("n", "go", ":Lspsaga outline<CR>")
map("n", "gd", ":Lspsaga goto_definition<CR>")
map("n", "<leader>t", ":Lspsaga term_toggle<CR>")


map("n", "M", ":Lspsaga show_line_diagnostics<CR>")

map("n", "<leader>w", ":lua vim.lsp.buf.format()<CR>")
-- map("n", "<leader><Tab>", "<C-w>w")

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Harpoon
map("n", "<leader>1", ":lua require('harpoon'):list():select(1)<CR>")
map("n", "<leader>2", ":lua require('harpoon'):list():select(2)<CR>")
map("n", "<leader>3", ":lua require('harpoon'):list():select(3)<CR>")
map("n", "<leader>4", ":lua require('harpoon'):list():select(4)<CR>")
map("n", "<leader>5", ":lua require('harpoon'):list():select(5)<CR>")
map("n", "<leader>a", ":lua require('harpoon'):list():add()<CR>")
map("n", "<leader>s", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>");
--
map("n", "<D-H>", "<C-w>h")
map("n", "<D-M-J>", "<C-w>j")
map("n", "<D-K>", "<C-w>k")
map("n", "<D-L>", "<C-w>l")
map("n", "<C-q>", "<C-w>q")
map("n", "<C-->", "<C-w>-")
map("n", "<C-+>", "<C-w>=")

vim.api.nvim_create_user_command('ToggleInlayHint', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, {})
vim.api.nvim_create_user_command('HarpoonAdd', function() require('harpoon'):list():add() end, {})
vim.api.nvim_create_user_command('HarpoonList', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, {})

-- map("n", "<leader>G", ":UndotreeToggle<CR>")
-- map("n", "<leader>l", ":lua vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())<CR> | :LspStart phpactor<CR>")
-- map("n", "<leader>K", ":Oil<CR>")
-- map("n", "<D-f>", ":Telescope live_grep<CR>");
-- map("n", "<D-k>", ":Telescope buffers<CR>");

-- map("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
-- map("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

-- map("n", "<C-b>", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>")
-- map("n", "<C-a>", ":lua require('harpoon'):list():append()<CR>")
-- map("n", "<leader>g", ":LazyGit<CR>")
-- map("n", "<D-o>", ":ChatGPT<CR>")
-- map("n", "<D-p>", ":lua require'telescope'.extensions.project.project{}<CR>")
-- vim.keymap.set({'n','t', '<A-d>', '<cmd>Lspsaga term_toggle'})
map("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
map("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
