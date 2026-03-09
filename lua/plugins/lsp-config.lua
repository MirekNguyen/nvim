vim.diagnostic.config({
  virtual_text = true,
  -- virtual_lines = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})

vim.lsp.inlay_hint.enable(false)

return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "html",
      "cssls",
      "emmet_language_server",
      "tailwindcss",
      "yamlls",
      "jsonls",
      -- "tsgo",
      "vtsls",
      "eslint",
      "oxlint",
      "bashls",
      "pyright",
      "fish_lsp",
      "lua_ls",
      "intelephense",
      "sqlls",
      "dockerls",
      "docker_compose_language_service",
      "nginx_language_server",
      "ansiblels",
      "terraformls",
      "helm_ls",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", cmd = { "Mason", "MasonUpdate" }, opts = {} },
    "neovim/nvim-lspconfig",
  },
}
