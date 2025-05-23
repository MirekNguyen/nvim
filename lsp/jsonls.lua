vim.lsp.config("jsonls", {
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
})
