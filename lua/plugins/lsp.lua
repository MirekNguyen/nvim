local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local root_dir = function() return vim.fn.getcwd() end

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup lspconfig.
local servers = require('lsp-options')

for server, args in pairs(servers) do
  local config = args or {} 
  config.capabilities = (args.capabilities or capabilities)
  config.root_dir = (args.root_dir or root_dir)
  lspconfig[server].setup(config)
end
