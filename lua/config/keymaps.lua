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

-- format
keymap.set("n", "<leader>w", ":lua vim.lsp.buf.format()<CR>", opts)

vim.api.nvim_create_user_command("ToggleInlayHint", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.api.nvim_create_user_command("TSImport", function()
  vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" } } })
end, {})

vim.api.nvim_create_user_command("TSRemove", function()
  vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnusedImports.ts", "source.removeUnused.ts" } } })
end, {})
