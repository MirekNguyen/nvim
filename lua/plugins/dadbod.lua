return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    {
      "tpope/vim-dadbod",
      lazy = true,
    },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  keys = {
    { "<leader>d", ":DBUIToggle<CR>" },
  },
  ft = { "db" },
  -- cmd = {
  --   "DBUI",
  --   "DBUIToggle",
  --   "DBUIAddConnection",
  --   "DBUIFindBuffer",
  -- },
  config = function()
    vim.g.db_ui_show_help = 0
    vim.api.nvim_create_autocmd({ "BufReadPost" }, {
      pattern = { "*.dbout" },
      callback = function()
        vim.api.nvim_exec2(
          [[
        exe ':resize 40'
        ]],
          {}
        )
      end,
    })
    vim.api.nvim_create_autocmd({ "BufReadPost" }, {
      pattern = { "*.dbout" },
      callback = function()
        vim.api.nvim_exec2(
          [[
        exe ':resize 20'
        ]],
          {}
        )
      end,
    })
  end,
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
