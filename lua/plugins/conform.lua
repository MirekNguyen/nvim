return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>w",
			"<cmd>lua require('conform').format({ async = true })<CR>",
			desc = "Format buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "eslint_d" },
			typescript = { "prettierd", "eslint_d" },
			javascriptreact = { "prettierd", "eslint_d" },
			typescriptreact = { "prettierd", "eslint_d" },
			sh = { "shfmt" },
			php = { "phpcbf" },
			sql = { "sql_formatter" },
			markdown = { "mdformat" },
			kotlin = { "ktlint" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters = {
			sql_formatter = {
				prepend_args = { "--config", '{"keywordCase": "upper"}' },
			},
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
