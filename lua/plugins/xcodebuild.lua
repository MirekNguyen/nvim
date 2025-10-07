return {
  "wojciech-kulik/xcodebuild.nvim",
  ft = { "swift" },
  dependencies = {
    "ibhagwan/fzf-lua",
    "folke/snacks.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
		{
			"<leader>o",
			"<cmd>XcodebuildRun<cr>",
			desc = "Debug diagnostic with AI",
		},
  },
  opts = {},
}
