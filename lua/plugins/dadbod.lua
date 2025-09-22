return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod" },
		{ "kristijanhusak/vim-dadbod-completion" },
	},
	keys = {
		{ "<leader>e", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" } },
	},
	lazy = false,
	-- ft = { "sql" },
	config = function()
		vim.g.db_ui_show_help = 0
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_auto_execute_table_helpers = 1
		vim.g.db_ui_execute_on_save = 0
		vim.g.db_ui_win_position = "right"
		vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast*" }
		vim.api.nvim_create_autocmd({ "BufReadPost" }, {
			pattern = { "*.dbout" },
			callback = function()
				vim.api.nvim_exec2([[ exe ':resize 30' ]], {})
			end,
		})
		-- Add this to your vim-dadbod-ui config
		vim.api.nvim_create_user_command("DBConnect", function(opts)
			vim.cmd("DB " .. opts.args)
			vim.schedule(function()
				require("vim_dadbod_completion").refresh()
			end)
		end, { nargs = 1 })
		vim.g.db_ui_table_helpers = {
			postgresql = {
				Insert = [[
				WITH cols AS (
   SELECT
      column_name, data_type, is_nullable, column_default, ordinal_position, table_name,
      CASE
          WHEN is_nullable = 'YES' THEN 'NULL'
          WHEN column_default IS NOT NULL THEN column_default
          ELSE
              CASE
                  WHEN data_type LIKE '%int%' THEN '[number]'
                  WHEN data_type LIKE '%bool%' THEN '[true|false]'
                  WHEN data_type LIKE '%timestamp%' THEN '[YYYY-MM-DD HH:MM:SS]'
                  WHEN data_type = 'date' THEN '[YYYY-MM-DD]'
                  ELSE '[text]'
              END
      END as value
   FROM information_schema.columns
   WHERE table_schema = '{schema}' AND table_name = '{table}'
)
SELECT
   'INSERT INTO ' || table_name || ' (' ||
   string_agg(column_name, ', ' ORDER BY ordinal_position) ||
   ') VALUES (' || E'\n    ' ||
   string_agg(
       rpad(value,40)
       || CASE WHEN ordinal_position <> mx THEN ',' ELSE '' END
       || ' -- ' || rpad(column_name,20)
       || ' | ' || rpad(CASE is_nullable WHEN 'NO' THEN 'REQUIRED' ELSE 'OPTIONAL' END, 8)
       || ' | ' || rpad(data_type,35)
       || ' | ' || COALESCE('DEFAULT = ' || column_default, '')
       , E'\n    ' ORDER BY ordinal_position
   ) ||
   E'\n);' AS insert_template
FROM (
   SELECT *, max(ordinal_position) over () as mx
   FROM cols
) sub
GROUP BY table_name;
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
				InsertRandom = [[
				WITH cols AS (
    SELECT
        column_name, data_type, is_nullable, column_default, ordinal_position, table_name,
        character_maximum_length, numeric_precision, numeric_scale,
        CASE
            WHEN is_nullable = 'YES' AND random() < 0.3
                THEN 'NULL'
            WHEN data_type LIKE '%int%' THEN
                -- Respect integer precision if available
                (CASE
                  WHEN numeric_precision IS NOT NULL AND numeric_precision <= 4 THEN floor(random()*9999)::int::text
                  WHEN numeric_precision IS NOT NULL AND numeric_precision > 4 THEN floor(random()*99999999)::int::text
                  ELSE floor(random()*1000)::int::text
                END)
            WHEN data_type LIKE '%serial%' THEN 'DEFAULT'
            WHEN data_type LIKE 'bool%' THEN (CASE WHEN random() < 0.5 THEN 'true' ELSE 'false' END)
            WHEN data_type LIKE '%timestamp%' THEN quote_literal(
                    (TIMESTAMP '2020-01-01' + (random()*3650)::int * INTERVAL '1 day')
                )
            WHEN data_type = 'date' THEN quote_literal(
                    (DATE '2020-01-01' + (random()*3650)::int)
                )
            WHEN data_type LIKE 'character%' OR data_type LIKE 'text' THEN quote_literal(
                    substring(md5(random()::text), 1, COALESCE(character_maximum_length, 12))
                )
            ELSE
                'NULL'
        END AS value
    FROM information_schema.columns
    WHERE table_schema = '{schema}' AND table_name = '{table}'
)
SELECT
   'INSERT INTO ' || table_name || ' (' ||
   string_agg(column_name, ', ' ORDER BY ordinal_position) ||
   ') VALUES (' || E'\n    ' ||
   string_agg(
       rpad(value, 32)
       || CASE WHEN ordinal_position <> mx THEN ',' ELSE '' END
       || ' -- ' || rpad(column_name,20)
       || ' | ' || rpad(data_type,24)
       || ' | ' || rpad(CASE is_nullable WHEN 'NO' THEN 'REQUIRED' ELSE 'OPTIONAL' END, 8)
       , E'\n    ' ORDER BY ordinal_position
   ) ||
   E'\n);' as insert_random_sample
FROM (
   SELECT *, max(ordinal_position) over () as mx
   FROM cols
) sub
GROUP BY table_name;
          ]],
			},
		}
	end,
}
