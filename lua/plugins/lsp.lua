local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Check if lsp-options-custom.lua exists
local user_lsp_config_path = vim.fn.stdpath('config')..'/lua/lsp-options-custom.lua'
local lsp_options

if vim.fn.filereadable(user_lsp_config_path) == 1 then
  lsp_options = require'lsp-options-custom'
else
  lsp_options = require'lsp-options'
end
local servers = lsp_options.servers

for server, args in pairs(servers) do
  local config = args or {}
  config.capabilities = (args.capabilities or capabilities)
  config.single_file_support = (args.single_file_support or true)
  lspconfig[server].setup(config)
end
