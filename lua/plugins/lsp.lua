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

lspconfig.phpactor.setup({
  autostart = false,
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.definitionProvider = false
  end,
  init_options = {
    ["language_server_worse_reflection.inlay_hints.enable"] = true,
    ["language_server_worse_reflection.inlay_hints.params"] = true,
    ["language_server_worse_reflection.inlay_hints.types"] = true,
    -- ["language_server_configuration.auto_config"] = false,
    -- ["code_transform.import_globals"] = true,
    -- ["language_server_phpstan.enabled"] = true,
    -- ["language_server_phpstan.level"] = 7,
    -- ["language_server_phpstan.bin"] = "phpstan",
  },
})
