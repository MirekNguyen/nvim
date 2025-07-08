return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme gruvbox]])
    require("gruvbox").setup({
      transparent_mode = true,
    })
  end,
}
