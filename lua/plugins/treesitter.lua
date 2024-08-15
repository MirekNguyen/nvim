local status, _ = pcall(require, "nvim-treesitter")
if not status then
	return
end

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"c_sharp",
		"cpp",
		"css",
		"fish",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"php",
		"phpdoc",
		"python",
		"scss",
		"tsx",
		"typescript",
		"vim",
		"yaml",
		"markdown",
		"markdown_inline",
		"latex",
		"twig",
		"sql",
		"xml",
		"rust",
		"gitignore",
		"dockerfile",
		"svelte",
		"toml",
		"requirements",
		"prisma",
		"http",
		"graphql",
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
})
