return {
  "mfussenegger/nvim-lint",
  event = 'VeryLazy',
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      sh = { "shellcheck", "bash" },
      php = { "phpstan", "phpcs" },
      -- sql = { "sqlfluff" },
      -- markdown = { "markdownlint" },
      -- typescript = { "biomejs" },
      -- javascript = { "biomejs" },

      typescript = { "oxlint" },
      javascript = { "oxlint" },
      kotlin = { "ktlint" },
      dotenv = { "dotenv_linter" },
      swift = { "swiftlint" },
      json = {'jsonlint'},
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    -- local oxlint = lint.linters.oxlint
    -- local args_to_add = { "--fix", "--fix-suggestions", "--fix-dangerously" }
    -- for _, arg in ipairs(args_to_add) do
    --   table.insert(oxlint.args, arg)
    -- end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
