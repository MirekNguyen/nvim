vim.lsp.config("intelephense", {
	init_options = {
		globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
		licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
	},
})
