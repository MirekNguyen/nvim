return {
  "ibhagwan/fzf-lua",
	keys = {
		{ "<D-j>", "<cmd>FzfLua files winopts.preview.layout=vertical<CR>", desc = "Find files" },
		{ "<D-J>", "<cmd>FzfLua files winopts.preview.layout=vertical no_ignore=true<CR>", desc = "Find all files" },
		{ "<D-l>", "<cmd>FzfLua git_files winopts.preview.layout=vertical<CR>", desc = "Find git files" },
    { "<D-L>", "<cmd>FzfLua grep_project winopts.preview.layout=vertical<CR>", desc = "Live grep" },
    { "<D-k>", "<cmd>FzfLua buffers<CR>", desc = "List buffers" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    winopts = {
      preview = {
        vertical = "down:60%",
      },
    },
    git = {
      files = {
        cmd = "git ls-files --cached --modified --others --deduplicate --exclude-standard",
      },
    },
    fzf_opts = {
      ["--exact"] = true,
    },
  }
}
