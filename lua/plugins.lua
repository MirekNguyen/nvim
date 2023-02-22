local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)
return require("lazy").setup({
  -- {
  --   'lifepillar/vim-gruvbox8', config = function() 
  --     vim.cmd([[colorscheme gruvbox8]])
  --     vim.g.gruvbox_italics = 0
  --     vim.g.gruvbox_italicize_strings = 0
  --   end
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end
  },

  { 'kyazdani42/nvim-tree.lua', config = function() require('plugins.nvim-tree') end, cmd = { 'NvimTreeToggle' } },
  { 
    'romgrk/barbar.nvim', 
    event = "BufRead",
    config = function() require('plugins.barbar') end, 
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },
  { 'nvim-telescope/telescope.nvim', cmd = "Telescope", dependencies = { 'nvim-lua/plenary.nvim' } },
  { 
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require('plugins.treesitter') end, event = "BufRead"
  },
  { 
    'neovim/nvim-lspconfig', 
    event = "BufRead",
    config = function () require('plugins.lsp') end,
    dependencies = {
      { 
        "williamboman/mason-lspconfig.nvim", config = function() require('mason-lspconfig').setup({ automatic_installation = true }) end,
        dependencies = { 
          "williamboman/mason.nvim", config = function() require('mason').setup() end, 
        },
      },
    }
  },
  { 
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    config = function() require('plugins.lsp-cmp') end,
    dependencies = {
      { 'L3MON4D3/LuaSnip', config = function() require('plugins.luasnip') end },
      { 'onsails/lspkind.nvim' },
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
    }
  },
  { 
    'jose-elias-alvarez/null-ls.nvim', 
    event = "InsertEnter",
    config = function() require('plugins.null-ls') end, 
    dependencies = { 'nvim-lua/plenary.nvim' } },
}, {
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  }
)
