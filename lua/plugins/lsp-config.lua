local function configuration()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
