return {
	servers = {
		helm_ls = {},
		omnisharp = {},
		texlab = {},
		bashls = {},
		pyright = {},
		clangd = {},
		cssls = {},
		eslint = {},
		emmet_language_server = { init_options = { showSuggestionsAsSnippets = true } },
		tailwindcss = { filetypes = { "typescriptreact", "javascriptreact" } },
		svelte = {},
		ts_ls = {},
		html = { filetypes = { "html", "twig", "blade", "latte" } },
		jsonls = {
			settings = {
				json = {
					schemas = {
						{ fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
						{ fileMatch = { "turbo.json" }, url = "https://turbo.build/schema.json" },
						{ fileMatch = { "tsconfig.json" }, url = "https://json.schemastore.org/tsconfig.json" },
						{ fileMatch = { ".prettierrc*" }, url = "https://json.schemastore.org/prettierrc.json" },
						{ fileMatch = { "nodemon.json" }, url = "https://json.schemastore.org/nodemon.json" },
						{ fileMatch = { "nest-cli.json" }, url = "https://json.schemastore.org/nest-cli.json" },
					},
				},
			},
		},
		intelephense = {
			init_options = {
				globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
				licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
			},
		},
		dockerls = {},
		docker_compose_language_service = {},
		lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
		rust_analyzer = {},
		yamlls = {
			settings = {
				yaml = {
					schemas = {
						["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
						["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json"] = "/*.k8s.{yaml,yml}",
						["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
					},
				},
			},
		},
		taplo = {},
		sqlls = {},
		prismals = {},
		nginx_language_server = {},
	},
	sources = function(null_ls)
		return {
			-- js
			null_ls.builtins.formatting.prettierd.with({ disabled_filetypes = { "markdown" } }),
			-- php
			null_ls.builtins.diagnostics.phpcs.with({
				extra_args = { "--standard=PSR12", "--exclude=Generic.WhiteSpace.DisallowTabIndent" },
			}),
			null_ls.builtins.formatting.phpcbf.with({
				extra_arg = { "--standard=/Users/mireknguyen/.local/projects/work/omnichannel/phpcs.xml" },
			}),
			null_ls.builtins.diagnostics.phpstan,
			-- sql
			null_ls.builtins.formatting.sql_formatter.with({
				extra_filetypes = { "mysql", "pgsql", "sqlite" },
				extra_args = { "--config", '{"keywordCase": "upper"}' },
			}),
			-- bash
			null_ls.builtins.formatting.shellharden,
			-- python
			null_ls.builtins.formatting.isort,
			null_ls.builtins.formatting.black,
			-- lua
			null_ls.builtins.formatting.stylua,
			-- other
			null_ls.builtins.formatting.nginx_beautifier,
			null_ls.builtins.diagnostics.hadolint,
			null_ls.builtins.diagnostics.markdownlint,
			null_ls.builtins.formatting.mdformat,
		}
	end,
}
