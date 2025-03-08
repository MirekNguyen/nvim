return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<D-L>", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<D-k>", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<D-j>", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>", desc = "Files files" },
		{
			"<D-J>",
			"<cmd>Telescope find_files find_command=rg,--no-ignore-vcs,--hidden,--files<CR>",
			desc = "Find all files",
		},
		{ "<D-l>", "<cmd>Telescope git_files show_untracked=true<CR>" },
		{ "<D-i>", "<cmd>Telescope command_history<CR>", desc = "Command history" },
		{ "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "LSP implementations" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						prompt_position = "top",
						preview_width = 0.8,
					},
				},
				sorting_strategy = "ascending",
			},
			extensions = {
				fzf = {
					fuzzy = false,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mireknguyen/telescope-path.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
}
