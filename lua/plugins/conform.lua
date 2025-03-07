return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>w",
			function()
				require("conform").format({ async = true })
			end,
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
			sh = { "shellharden", "shfmt" },
			php = { "phpcbf" },
			sql = { "sql_formatter" },
			nginx = { "nginx_beautifier" },
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
