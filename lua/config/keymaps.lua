---Sets a keymap in Neovim for normal or visual mode
---@param mode "'n'" | "'v'" The mode for which the keymap is active ('n' for normal mode, 'v' for visual mode)
---@param shortcut string The key combination for the shortcut
---@param command string The command or action to be executed
function Keymap(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- normal
Keymap("n", "<leader>yy", '"+yy')
Keymap("n", "<leader>Y", '"+Y')
Keymap("n", "<leader>dd", '"+dd')
Keymap("n", "<leader>p", '"+p')
Keymap("n", "<leader>P", '"+P')

-- visual
Keymap("v", "<leader>y", '"+y')
Keymap("v", "<leader>d", '"+d')
Keymap("v", "<leader>p", '"+p')
Keymap("v", "<leader>P", '"+P')

-- format
Keymap("n", "<leader>w", ":lua vim.lsp.buf.format()<CR>")

-- Telescope
Keymap("n", "<leader>g", ":Telescope live_grep<CR>")
Keymap("n", "<C-b>", ":Telescope buffers<CR>")
Keymap("n", "<D-j>", ":Telescope telescope_path<CR>")
Keymap("n", "<D-J>", ":Telescope telescope_path_forward<CR>")
Keymap("n", "<D-l>", ":lua require'telescope.builtin'.git_files{show_untracked=true}<CR>")

-- Lspsaga
Keymap("n", "ga", ":Lspsaga code_action<CR>")
Keymap("n", "gf", ":Lspsaga finder<CR>")
Keymap("n", "K", ":Lspsaga hover_doc ++keep<CR>")
Keymap("n", "L", ":Lspsaga peek_definition<CR>")
Keymap("n", "gr", ":Lspsaga rename<CR>")
Keymap("n", "go", ":Lspsaga outline<CR>")
Keymap("n", "gd", ":Lspsaga goto_definition<CR>")
Keymap("n", "M", ":Lspsaga show_line_diagnostics<CR>")

-- Harpoon
Keymap("n", "<leader>1", ":lua require('harpoon'):list():select(1)<CR>")
Keymap("n", "<leader>2", ":lua require('harpoon'):list():select(2)<CR>")
Keymap("n", "<leader>3", ":lua require('harpoon'):list():select(3)<CR>")
Keymap("n", "<leader>4", ":lua require('harpoon'):list():select(4)<CR>")
Keymap("n", "<leader>5", ":lua require('harpoon'):list():select(5)<CR>")
Keymap("n", "<leader>a", ":lua require('harpoon'):list():add()<CR>")
Keymap("n", "<leader>s", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>")

vim.api.nvim_create_user_command("HarpoonAdd", function()
	require("harpoon"):list():add()
end, {})
vim.api.nvim_create_user_command("HarpoonList", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, {})

-- dadbod
Keymap("n", "<leader>d", ":DBUIToggle<CR>")

-- window navigation
Keymap("n", "<D-H>", "<C-w>h")
Keymap("n", "<D-M-J>", "<C-w>j")
Keymap("n", "<D-K>", "<C-w>k")
Keymap("n", "<D-L>", "<C-w>l")
Keymap("n", "<C-q>", "<C-w>q")
Keymap("n", "<C-->", "<C-w>-")
Keymap("n", "<C-+>", "<C-w>=")

vim.api.nvim_create_user_command("ToggleInlayHint", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

-- Keymap("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
-- Keymap("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
