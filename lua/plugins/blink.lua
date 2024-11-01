return {
	"saghen/blink.cmp",
	enabled = true,
	event = { "LspAttach", "InsertCharPre" },
	version = "v0.*",
  dependencies = 'rafamadriz/friendly-snippets',
	opts = {
		keymap = {
			["<C-a>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

      ['<Tab>'] = {
        function(cmp)
          if cmp.is_in_snippet() then return cmp.accept()
          end
        end,
        'select_next',
        'snippet_forward',
        'fallback'
      },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},
		autocomplete = {
		},
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = "normal",
    accept = { auto_brackets = { enabled = true } },
    -- trigger = {
    --   signature_help = {
    --     enabled = true,
    --     show_on_insert_on_trigger_character = true,
    --   },
    -- },
		windows = {
			autocomplete = {
			  draw = 'reversed', -- 'minimal' | 'reversed' | 'simple'
				border = "single",
			},
			documentation = {
				auto_show = true,
        -- auto_show_delay_ms = 0,
        -- update_delay_ms = 0,
				border = "single",
			},
      -- ghost_text = {
      --   enabled = true,
      -- },
		},
	},
}
