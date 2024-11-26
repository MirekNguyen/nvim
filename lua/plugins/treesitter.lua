local tsconfig = {
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cpp",
    "css",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "php",
    "python",
    "tsx",
    "typescript",
    "yaml",
    "markdown",
    "sql",
    "xml",
    "rust",
    "gitignore",
    "dockerfile",
    "toml",
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
