return {
	"saghen/blink.cmp",
	enabled = true,
	event = { "InsertCharPre" },
	version = "v0.*",
	dependencies = "rafamadriz/friendly-snippets",
	opts = {
		keymap = {
			["<C-a>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				"select_next",
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},
		sources = {
      default = { "lsp", "path", "snippets", "buffer", "dadbod" },
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink", score_offset = 2000 },
			},
		},
		completion = {
		  list = {
		    selection = {
		      preselect = false
        }
      },
			trigger = {
				show_on_insert_on_trigger_character = false,
			},
			menu = {
				border = "single",
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon" }, { "kind" } },
				},
			},
			documentation = {
				auto_show_delay_ms = 0,
				window = {
					border = "single",
				},
			},
		},
	},
}
