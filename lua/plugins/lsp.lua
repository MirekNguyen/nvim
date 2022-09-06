local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup lspconfig.
-- Use a loop to conveniently call 'setup' on multiple servers and
local servers = {
  "clangd", "bashls", "cssls", "intelephense", "sumneko_lua", "emmet_ls"
}
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    root_dir = function()
      return vim.fn.getcwd()
    end
  }
end
lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  root_dir = function()
    return vim.fn.getcwd()
  end
}
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  filetypes = { "html", "php", "css", "sass", "scss", "postcss", "less", "javascript", "javascriptreact", "typescript",
    "typescriptreact", "vue", "svelte" },
  root_dir = function()
    return vim.fn.getcwd()
  end
}

-- Turn off formatting, null-ls will take care of formatting with prettier
local prettierServers = {
  "tsserver", "html", "jsonls"
}
for _, lsp in pairs(prettierServers) do
  lspconfig[lsp].setup {
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end,
    capabilities = capabilities,
    root_dir = function()
      return vim.fn.getcwd()
    end
  }
end
