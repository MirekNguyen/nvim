return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
	{ "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
	{
		"jackMort/ChatGPT.nvim",
		cmd = { "ChatGPT", "ChatGPTRun" },
		config = function()
			require("chatgpt").setup({
				chat = {
					openai_params = {
						model = "gpt-4o",
						max_tokens = 4096,
					},
					openai_edit_params = {
						model = "gpt-4o",
					},
					keymaps = {
						select_session = "o",
					},
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
  {
    "Laravel",
    "RicardoRamirezR/blade-nav.nvim",
    "adalessa/laravel.nvim",
  },
	{ "lewis6991/gitsigns.nvim", opts = { signcolumn = false }, cmd = "Gitsigns" },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
      }
    end,
    lazy = false,
  },
  {
    "FireIsGood/spaceman.nvim",
    config = function()
      require("spaceman").setup({
        workspaces = {
          { "gtm-scoring", "~/.local/projects/work/gtm-scoring/" },
          { "omnnichannel", "~/.local/projects/work/omnichannel/" },
          { "nvim", "~/.config/nvim" },
        },
        use_default_keymaps = true,
      })
    end,
    cmd = "Spaceman",
  },
	{
		"brenoprata10/nvim-highlight-colors",
		filetypes = { "html", "css" },
	},
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    cmd = { "Trouble", "TroubleToggle" },
  },
  { "luckasRanarison/tailwind-tools.nvim", event = "VeryLazy" , config = true },
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
	},
	{
		"kawre/leetcode.nvim",
		lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
		config = true,
	},
	{
		"uga-rosa/translate.nvim",
		opts = {
			default = {
				command = "google",
				output = "replace",
			},
		},
		cmd = "Translate",
	},
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				width = 0.4,
			},
		},
		cmd = "ZenMode",
	},
	  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = true,
				auto_refresh = true, -- auto refresh panel
				layout = {
					position = "right", -- | top | left | right
					ratio = 0.4, -- width of the panel, when position is left or right
				},
			},
			suggestion = {
				enabled = true, -- enable suggestions
				auto_trigger = true, -- automatically show suggestions
				accept = false, -- disable built-in keymapping
				keymap = {
					accept = "<C-f>",
					next = "<C-;>",
					prev = "<C-'>",
					dismiss = "<C-\\>",
				},
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = {"CopilotChat", "CopilotChatExplain", "CopilotChatTests", "CopilotChatReview", "CopilotChatRefactor", "CopilotChatOptimize" },
		opts = {
			mode = "split", -- newbuffer or split  , default: newbuffer
		},
	},
	{
		"jackMort/ChatGPT.nvim",
		cmd = { "ChatGPT", "ChatGPTRun" },
		config = function()
			require("chatgpt").setup({
				chat = {
					openai_params = {
						model = "gpt-3.5-turbo",
						max_tokens = 4096,
					},
					openai_edit_params = {
						model = "gpt-3.5-turbo",
					},
					keymaps = {
						select_session = "o",
					},
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{ "sindrets/diffview.nvim",
	  cmd = "DiffviewOpen",
	},
	{ "MirekNguyen/czech-diacritics.nvim", config = true, cmd = "AddDiacritics" },
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvim-tree")
		end,
		cmd = { "NvimTreeToggle" },
	},
  { "tpope/vim-fugitive", lazy = false },
}
