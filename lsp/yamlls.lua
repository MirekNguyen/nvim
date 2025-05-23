vim.lsp.config("yamlls", {
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
})
