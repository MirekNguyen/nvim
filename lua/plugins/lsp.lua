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

for _, server in pairs(servers) do
  lspconfig[server.name].setup {
    capabilities = (server.capabilities or capabilities),
    filetypes = (server.filetypes or nil),
    root_dir = (server.root_dir or root_dir),
    on_attach = (server.on_attach or nil),
    init_options = (server.init_options or nil),
  }
end
