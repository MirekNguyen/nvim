local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

-- Check if lsp-options-custom.lua exists
local user_lsp_config_path = vim.fn.stdpath('config')..'/lua/lsp-options-custom.lua'
local config

if vim.fn.filereadable(user_lsp_config_path) == 1 then
  config = require'../lsp-options-custom'
else
  config = require'../lsp-options'
end

null_ls.setup({
    sources = config.sources(null_ls)
})
