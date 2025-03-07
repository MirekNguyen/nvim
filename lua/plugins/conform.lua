return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>w",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "eslint_d" },
			typescript = { "prettierd", "eslint_d" },
			javascriptreact = { "prettierd", "eslint_d" },
			typescriptreact = { "prettierd", "eslint_d" },
			sh = { "shellharden" },
			php = { "phpcbf" },
			sql = { "sql_formatter" },
			nginx = { "nginx_beautifier" },
			markdown = { "mdformat" },
			kotlin = { "ktlint" },
		}, -- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		-- format_on_save = { timeout_ms = 500 },
		-- Customize formatters
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
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
