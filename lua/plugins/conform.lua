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
      javascript = { "oxfmt", "prettierd", "eslint_d" },
      typescript = { "oxfmt", "prettierd", "eslint_d" },
      javascriptreact = { "oxfmt", "prettierd", "eslint_d" },
      typescriptreact = { "oxfmt", "prettierd", "eslint_d" },
      -- javascript = { "oxfmt"},
      -- typescript = { "oxfmt"},
      -- javascriptreact = { "oxfmt"},
      -- typescriptreact = { "oxfmt"},
      -- javascript = { "biome", "biome-check", "biome-organize-imports", "prettierd", "eslint_d" },
      -- typescript = { "biome", "biome-check", "biome-organize-imports", "prettierd", "eslint_d" },
      -- javascriptreact = { "biome", "biome-check", "biome-organize-imports", "prettierd", "eslint_d" },
      -- typescriptreact = { "biome", "biome-check", "biome-organize-imports", "prettierd", "eslint_d" },
      sh = { "shfmt" },
      php = { "phpcbf" },
      sql = { "sql_formatter" },
      markdown = { "mdformat" },
      kotlin = { "ktlint" },
      swift = { "swiftformat" },
    },
    -- format_on_save = function(bufnr)
    --   local ignore_filetypes = { "oil" }
    --   if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
    --     return
    --   end
    --
    --   return { timeout_ms = 500, lsp_fallback = true }
    -- end,
    -- log_level = vim.log.levels.ERROR,
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
      oxfmt = {
        command = "oxfmt",
        args = { "$FILENAME" },
        stdin = false,
        -- When stdin=false, use this template to generate the temporary file that gets formatted
        tmpfile_format = ".conform.$RANDOM.$FILENAME",
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
