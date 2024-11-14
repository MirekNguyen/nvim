return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  },
  keys = {
    { "<leader>d", ":DBUIToggle<CR>" },
    { "<leader>e", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" } },
    { "<leader>B", "<Plug>(DBUIFindBuffer)", mode = { "n", "v" } },
  },
  lazy = false,
  ft = { "sql" },
  -- cmd = {
  --   "DBUI",
  --   "DBUIToggle",
  --   "DBUIAddConnection",
  --   "DBUIFindBuffer",
  -- },
  config = function()
    vim.g.db_ui_show_help = 0
    -- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    --   pattern = { "*.dbout" },
    --   callback = function()
    --     vim.api.nvim_exec2(
    --       [[
    --     exe ':resize 60'
    --     ]],
    --       {}
    --     )
    --   end,
    -- })
    vim.api.nvim_create_autocmd({ "BufReadPost" }, {
      pattern = { "*.dbout" },
      callback = function()
        vim.api.nvim_exec2(
          [[
        exe ':resize 30'
        ]],
          {}
        )
      end,
    })
  end,
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_execute_on_save = 0
    vim.g.db_ui_tmp_query_location = vim.fn.stdpath("data") .. "/dadbod_queries"
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast*" }
    vim.g.db_ui_table_helpers = {
      postgresql = {
        Insert = [[
            SELECT
                'INSERT INTO {schema}.{table} (' ||
                string_agg(column_name, ', ' ORDER BY ordinal_position) ||
                ') VALUES (' ||
                string_agg(':' || column_name, ', ' ORDER BY ordinal_position) ||
                ');'
            FROM information_schema.columns
            WHERE table_schema = '{schema}'
            AND table_name = '{table}'
            AND is_nullable = 'NO'
            AND column_default IS NULL
        ]],
        InsertAll = [[
            WITH cols AS (
                SELECT
                    column_name,
                    ordinal_position
                FROM information_schema.columns
                WHERE table_schema = '{schema}'
                AND table_name = '{table}'
            )
            SELECT
                'INSERT INTO {schema}.{table} (' ||
                string_agg(column_name, ', ' ORDER BY ordinal_position) ||
                ') VALUES (' ||
                string_agg(':' || column_name, ', ' ORDER BY ordinal_position) ||
                ');'
            FROM cols;
        ]],
      },
    }
  end,
}
