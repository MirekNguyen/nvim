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
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
  require("plugins.chatgpt-nvim"),
  require("plugins.tailwind-tools"),
  require("plugins.oil"),
  require("plugins.dadbod"),
  require("plugins.wtf"),
  require("plugins.harpoon"),
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = true,
    opts = {
      hint_enable = false,
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    config = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
  },
  require("plugins.telescope"),
  require("plugins.treesitter"),
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "Mason", "LspInstall", "LspUninstall", "LspInfo" },
    config = function()
      require("plugins.lsp")
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        config = true,
        opts = { automatic_installation = true },
        dependencies = {
          "williamboman/mason.nvim",
          config = true,
        },
      },
    },
  },
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
      { "onsails/lspkind.nvim" },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    -- lazy = false,
    config = function()
      require("plugins.null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
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
        -- "tutor",
        "zipPlugin",
        -- "rplugin", -- remote plugins
        "spellfile",
        -- "man", -- ':Man' command (man pages)
        "shada", -- search, command history, marks
        "health", -- ':checkhealth' command
      },
    },
  },
  defaults = { lazy = true },
})
