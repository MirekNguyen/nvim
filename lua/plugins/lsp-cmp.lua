local function config()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local luasnip = require("luasnip")

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
			}),
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "vim-dadbod-completion" },
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		view = { entries = "custom" },
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-a>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if luasnip.expandable() then
						luasnip.expand()
					else
						cmp.confirm({
							select = true,
						})
					end
				else
					fallback()
				end
			end),

			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
	})

	vim.g.completion_matching_strategy_list = { "exact", "substring" }
	vim.g.completion_matching_ignore_case = 1

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "sql", "mysql", "plsql" },
		callback = function()
			require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
		end,
	})

	vim.g.completion_chain_complete_list = {
		sql = {
			{ complete_items = { "vim-dadbod-completion" } },
		},
	}
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	config = config,
	enabled = false,
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
			end,
			dependencies = {
			  "rafamadriz/friendly-snippets"
      }
		},
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
	},
}
