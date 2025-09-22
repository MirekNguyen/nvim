return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	enabled = true,
	ft = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	opts = {
		settings = {
			tsserver_file_preferences = {
				-- includeInlayParameterNameHints = "all",
				-- includeInlayVariableTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				-- includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				-- includeInlayEnumMemberValueHints = true,
			},
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
}
