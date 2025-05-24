return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	keys = {
		{ "<leader>k", "<cmd>Oil<cr>", desc = "Open Oil" },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
		lsp_file_methods = {
			autosave_changes = true,
		},
	},
}
