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
						kubernetes = "*.k8s.{yml,yaml}",
						["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
						["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json"] = "/*.k8s.{yaml,yml}",
						["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						["https://json.schemastore.org/pnpm-workspace.json"] = "pnpm-workspace.{yml,yaml}",
					},
				},
			},
		},
		taplo = {},
		sqlls = {},
		prismals = {},
		nginx_language_server = {},
		jdtls = {},
		ansiblels = {},
		terraformls = {},
		lemminx = {},
		kotlin_language_server = {},
	},
}
