local function configuration()
  local lspconfig = require('lspconfig')
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Check if lsp-options-custom.lua exists
  local user_lsp_config_path = vim.fn.stdpath('config') .. '/lua/lsp-options-custom.lua'
  local lsp_options

  if vim.fn.filereadable(user_lsp_config_path) == 1 then
    lsp_options = require 'lsp-options-custom'
  else
    lsp_options = require 'lsp-options'
  end
  local servers = lsp_options.servers

  for server, args in pairs(servers) do
    local config = args or {}
    config.capabilities = (args.capabilities or capabilities)
    config.single_file_support = (args.single_file_support or true)
    lspconfig[server].setup(config)
  end

  -- lspconfig.phpactor.setup({
  --   autostart = true,
  --   on_attach = function(client, bufnr)
  --     client.server_capabilities.hoverProvider = false
  --     client.server_capabilities.definitionProvider = false
  --   end,
  --   init_options = {
  --     ["language_server_worse_reflection.inlay_hints.enable"] = true,
  --     ["language_server_worse_reflection.inlay_hints.params"] = true,
  --     ["language_server_worse_reflection.inlay_hints.types"] = false,
  --     -- ["language_server_configuration.auto_config"] = false,
  --     -- ["code_transform.import_globals"] = true,
  --     -- ["language_server_phpstan.enabled"] = true,
  --     -- ["language_server_phpstan.level"] = 7,
  --     -- ["language_server_phpstan.bin"] = "phpstan",
  --   },
  -- })

  require('lspconfig').yamlls.setup {
    settings = {
      yaml = {
        schemas = {
          -- kubernetes = "/*.k8s.{yml,yaml}",
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
          ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json"] = "/*.k8s.{yaml,yml}",
        },
      },
    }
  }
  vim.lsp.inlay_hint.enable(true)
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Mason", "LspInstall", "LspUninstall", "LspInfo" },
  config = configuration,
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      config = true,
      opts = { automatic_installation = true },
      dependencies = {
        "williamboman/mason.nvim",
        config = true,
      },
    },
  },
}
