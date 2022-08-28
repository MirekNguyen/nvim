vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'morhetz/gruvbox'
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- use 'Mofiqul/dracula.nvim'

  -- Nvim-tree
  use 'ryanoasis/vim-devicons' -- NerdTree icons
  use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons', -- optional, for file icons
  }
  use { 'romgrk/barbar.nvim', -- tabs in neovim, nvim-tree
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Navigation
  use 'christoomey/vim-tmux-navigator' -- navigate between tmux and neovim seamlessly
  use 'ggandor/lightspeed.nvim' -- quickly navigate using 's' and 'S' keys
  use {
    "SmiteshP/nvim-gps", -- status line location (e.g. demo.cpp > main > mystruct)
    requires = "nvim-treesitter/nvim-treesitter",
    config = function() require('nvim-gps').setup() end
  }
  use {
    'nacro90/numb.nvim', -- peeks lines of buffer in non-obtrusive way
    config = function() require('numb').setup() end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- LSP cmp = autosuggestion
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline'
    }
  }

  -- LSP cmp = snippets
  use { 'L3MON4D3/LuaSnip',
    requires = 'saadparwaiz1/cmp_luasnip',
    config = function() require('luasnip.loaders.from_vscode').lazy_load() end
  }
  use 'rafamadriz/friendly-snippets'
  use 'aca/emmet-ls'

  -- LSP other
  use 'onsails/lspkind.nvim'
  use { 'ray-x/lsp_signature.nvim',
    config = function()
      require "lsp_signature".setup({
        bind = true,
        handler_opts = {
          border = "rounded"
        }
      })
    end
  }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })

  -- Text editing, autopairs
  use 'jiangmiao/auto-pairs' -- auto pair brackets, quotations
  use { 'lukas-reineke/indent-blankline.nvim', -- add indentation guideline
    config = function() require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }
  use 'tpope/vim-repeat' -- repeat last command, vim-surround
  use 'tpope/vim-surround' -- ability to change brackets, quotations
  use 'AndrewRadev/tagalong.vim' -- for editing HTML tags on both side
  use {
    'norcalli/nvim-colorizer.lua', -- visualize colors in html, css
    config = function() require('colorizer').setup({ '*'; }) end
  }

  -- Code format, troubleshoot
  use 'prettier/vim-prettier'
  use {
    'folke/trouble.nvim', -- navigate through warnings, error_message
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end
  }
  -- Telescope navigation
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons' -- Add icons to telescope
  use { 'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Terminal in neovim
  use 'voldikss/vim-floaterm'
  use { 'akinsho/toggleterm.nvim',
    config = function() require("toggleterm").setup() end
  }

  -- Speed up neovim
  use {
    'lewis6991/impatient.nvim',
    config = function() require('impatient').enable_profile() end
  }
  use 'nathom/filetype.nvim'
  use 'dstein64/vim-startuptime' -- check startup time

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  -- Git
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('diffview').setup() end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  }

  -- Markdown
  use { 'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  use 'jose-elias-alvarez/null-ls.nvim'
end)
