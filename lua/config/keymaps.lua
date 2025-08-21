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
-- keymap.set("n", "<c-[>", '<cmd>bprev<cr>', opts)
-- keymap.set("n", "<c-]>", '<cmd>bnext<cr>', opts)

vim.api.nvim_create_user_command("ToggleInlayHint", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.api.nvim_create_user_command("TSImport", function()
  vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" } } })
end, {})

vim.api.nvim_create_user_command("TSRemove", function()
  vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnusedImports.ts", "source.removeUnused.ts" } } })
end, {})

keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
