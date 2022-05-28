lua << EOF
require('nvim-autopairs').setup{}
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require('lspconfig').tsserver.setup {on_attach = custom_attach, root_dir = vim.loop.cwd }
local on_attach = function(client, bufnr)
   local map = vim.api.nvim_buf_set_keymap
map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
map(0, "n", "ca", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
map(0, "x", "ca", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
map(0, "n", "<C-k>", "<cmd>Lspsaga signature_help<cr>", {silent = true, noremap = true})
end
-- Setup lspconfig.
-- Use a loop to conveniently call 'setup' on multiple servers and
local servers = { 'clangd', 'html', 'grammarly', 'cssls'  }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup { 
     on_attach = on_attach,
     }
end
EOF
