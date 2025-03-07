local tsconfig = {
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = false,
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
