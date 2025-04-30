local function configuration()
  local lspconfig = require("lspconfig")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local servers = vim.env.ENABLE_LSP_SERVERS == "false" and {} or require("config.lsp-options").servers

  for server, args in pairs(servers) do
    local config = args or {}
    config.capabilities = (args.capabilities or capabilities)
    config.single_file_support = (args.single_file_support or true)
    lspconfig[server].setup(config)
  end

  vim.lsp.inlay_hint.enable(true)
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  version = "*",
  cmd = { "Mason", "LspInstall", "LspUninstall", "LspInfo" },
  config = configuration,
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        automatic_installation = true
      },
    },
  },
}
