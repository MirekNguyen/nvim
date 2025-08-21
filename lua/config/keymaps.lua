local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- clipboard
keymap.set("n", "<leader>yy", '"+yy', opts)
keymap.set("n", "<leader>Y", '"+Y', opts)
keymap.set("n", "<leader>dd", '"+dd', opts)
keymap.set("n", "<leader>p", '"+p', opts)
keymap.set("n", "<leader>P", '"+P', opts)
keymap.set("v", "<leader>y", '"+y', opts)
keymap.set("v", "<leader>d", '"+d', opts)
keymap.set("v", "<leader>p", '"+p', opts)
keymap.set("v", "<leader>P", '"+P', opts)
