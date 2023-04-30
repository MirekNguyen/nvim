local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)
return require("lazy").setup({
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end
  },

  { 'kyazdani42/nvim-tree.lua', config = function() require('plugins.nvim-tree') end, cmd = { 'NvimTreeToggle' } },
  { 
    'romgrk/barbar.nvim', 
    event = {"BufReadPost", "BufNewFile"},
    config = function() require('plugins.barbar') end, 
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },
  { 'nvim-telescope/telescope.nvim', cmd = "Telescope", dependencies = { 'nvim-lua/plenary.nvim' } },
  { 
    'nvim-treesitter/nvim-treesitter',
    event = {"BufReadPost", "BufNewFile"},
    config = function() require('plugins.treesitter') end,
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  { 
    'neovim/nvim-lspconfig', 
    event = {"BufReadPost", "BufNewFile"},
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
    event = {"BufReadPost", "BufNewFile"},
    config = function() require('plugins.null-ls') end, 
    dependencies = { 'nvim-lua/plenary.nvim' } 
  },
  {
    "glepnir/lspsaga.nvim",
    event = "InsertEnter",
    config = function()
        require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
        diagnostic = {
          on_insert = false,
        },
        lightbulb = {
          sign = false
        }
        })
    end,
  },
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },
  { 'lewis6991/gitsigns.nvim', opts = { signcolumn = false }, cmd = 'Gitsigns' },
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
          "rplugin", -- remote plugins
          "spellfile",
          "man", -- ':Man' command (man pages)
          "shada", -- search, command history, marks
          "health", -- ':checkhealth' command
        },
      },
    },
  }
)
