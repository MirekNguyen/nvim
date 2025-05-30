return {
	"mfussenegger/nvim-lint",
	lazy = false,
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			sh = { "shellcheck", "bash" },
			php = { "phpstan", "phpcs" },
			sql = { "sqlfluff" },
			markdown = { "markdownlint" },
			kotlin = { "ktlint" },
			dotenv = { "dotenv_linter" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
