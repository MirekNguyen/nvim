local tsconfig = {
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
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup(tsconfig)
  end,
}
