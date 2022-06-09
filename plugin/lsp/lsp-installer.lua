require("nvim-lsp-installer").setup({
    ensure_installed = {"clangd", "bashls", "cssls", "eslint", "emmet_ls", "html", "intelephense", "jdtls", "jsonls", "pyright", "sumneko_lua", "tailwindcss", "tsserver", "vimls", "yamlls"},
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
