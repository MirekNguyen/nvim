vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})
vim.lsp.inlay_hint.enable(true)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "Mason", "LspInstall", "LspUninstall", "LspInfo" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"bashls",
					"helm_ls",
					"omnisharp",
					"texlab",
					"bashls",
					"pyright",
					"clangd",
					"cssls",
					"eslint",
					"svelte",
					"ts_ls",
					"dockerls",
					"docker_compose_language_service",
					"lua_ls",
					"rust_analyzer",
					"taplo",
					"sqlls",
					"prismals",
					"nginx_language_server",
					"jdtls",
					"ansiblels",
					"terraformls",
					"lemminx",
					"kotlin_language_server",

					"html",
					"intelephense",
					"emmet_language_server",
					"tailwindcss",
					"jsonls",
					"yamlls",
				},
			},
		},
	},
}
