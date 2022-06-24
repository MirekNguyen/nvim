local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

function nmap(shortcut, command)
   vim.api.nvim_buf_set_keymap(0, "n", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

local on_attach = function(client, bufnr)
   nmap("gh", ":Lspsaga lsp_finder")
   nmap("gd", ":Lspsaga preview_definition")
   nmap("ca", ":Lspsaga code_action")
   -- Hover Doc
   nmap("K", ":Lspsaga hover_doc")
   nmap("<C-u>", ":lua require('lspsaga.action').smart_scroll_with_saga(1)")
   nmap("<C-i>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1)")
   --
   nmap("gs", ":Lspsaga signature_help")
   nmap("gr", ":Lspsaga rename")
   nmap("gd", ":Lspsaga preview_definition")
   nmap("[e", ":Lspsaga diagnostic_jump_prev")
   nmap("]e", ":Lspsaga diagnostic_jump_next")

end
-- Setup lspconfig.
-- Use a loop to conveniently call 'setup' on multiple servers and
local lspconfig = require('lspconfig')
local servers = {
   "clangd", "bashls", "cssls", "eslint", "html", "intelephense", "jdtls", "jsonls", "pyright",
   "tailwindcss", "tsserver", "sumneko_lua", "emmet_ls"
}
for _, lsp in pairs(servers) do
   lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = function()
         return vim.fn.getcwd()
      end
   }
end
