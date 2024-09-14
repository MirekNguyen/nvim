local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
return require("lazy").setup({
  require("plugins.colorscheme"),
  require("plugins.chatgpt-nvim"),
  require("plugins.tailwind-tools"),
  require("plugins.oil"),
  require("plugins.dadbod"),
  require("plugins.wtf"),
  require("plugins.harpoon"),
  require("plugins.lsp-signature"),
  require("plugins.kitty-scrollback"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require('plugins.lsp'),
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.lsp-cmp")
    end,
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("plugins.luasnip")
        end,
      },
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  require('plugins.none-ls'),
  require("plugins.lsp-saga"),
  require("plugins.copilot"),
}, {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", -- edit zip files
        -- "matchit", -- match XML tags using '%'
        -- "matchparen", -- highlight matching brackets
        -- "netrwPlugin",
        "tarPlugin", -- edit tar files
        "tohtml",
        "tutor",
        "zipPlugin",
        -- "rplugin", -- remote plugins
        "spellfile",
        "man", -- ':Man' command (man pages)
        "shada", -- search, command history, marks
        "health", -- ':checkhealth' command
      },
    },
  },
  defaults = { lazy = true },
})
