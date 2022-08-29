local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Dependency
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'

  -- Themes
  use 'morhetz/gruvbox'
  use 'nvim-lualine/lualine.nvim'

  -- Nvim-tree
  use 'kyazdani42/nvim-tree.lua'
  use 'romgrk/barbar.nvim' -- tabs in neovim, nvim-tree

  -- Navigation
  use 'christoomey/vim-tmux-navigator' -- navigate between tmux and neovim seamlessly
  use 'ggandor/lightspeed.nvim' -- quickly navigate using 's' and 'S' keys
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    "SmiteshP/nvim-gps", -- status line location (e.g. demo.cpp > main > mystruct)
    requires = "nvim-treesitter/nvim-treesitter"
  }
  use 'nacro90/numb.nvim' -- peeks lines of buffer in non-obtrusive way
  use 'nvim-telescope/telescope.nvim' -- telescope navigation

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

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
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'aca/emmet-ls'

  -- LSP other
  use 'onsails/lspkind.nvim'
  use 'ray-x/lsp_signature.nvim'
  use({ "glepnir/lspsaga.nvim", branch = "main", })

  -- Text editing, autopairs
  use 'jiangmiao/auto-pairs' -- auto pair brackets, quotations
  use 'lukas-reineke/indent-blankline.nvim' -- add indentation guideline
  use 'tpope/vim-repeat' -- repeat last command, vim-surround
  use 'tpope/vim-surround' -- ability to change brackets, quotations
  use 'AndrewRadev/tagalong.vim' -- for editing HTML tags on both side
  use 'norcalli/nvim-colorizer.lua' -- visualize colors in html, css

  -- Code format, troubleshoot
  use 'prettier/vim-prettier'
  use 'folke/trouble.nvim' -- navigate through warnings, error_message
  use 'numToStr/Comment.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Terminal in neovim
  use 'voldikss/vim-floaterm'
  use 'akinsho/toggleterm.nvim'

  -- Speed up neovim
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'
  use 'dstein64/vim-startuptime' -- check startup time

  -- Git
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'

  -- Markdown
  use { 'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
