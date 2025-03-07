return {
	"mfussenegger/nvim-lint",
	enabled = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
	  local lint = require("lint")
		lint.linters_by_ft = {
			sh = { "shellcheck", "bash" },
      php = { 'phpcs', 'phpstan' },
			sql = { "sqlfluff" },
			nginx = { "nginx-lint" },
			markdown = { "markdownlint" },
			kotlin = { "ktlint" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
  end
}
