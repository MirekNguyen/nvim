vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
   use 'wbthomason/packer.nvim'

   -- Themes
   use 'morhetz/gruvbox'
   use 'nvim-lualine/lualine.nvim'
   -- use 'Mofiqul/dracula.nvim'

   -- NerdTree
   use 'ryanoasis/vim-devicons' -- NerdTree icons
   use 'kyazdani42/nvim-tree.lua'
   use 'romgrk/barbar.nvim'

   -- Navigation
   use 'christoomey/vim-tmux-navigator'
   use 'ggandor/lightspeed.nvim'
   use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter"
   }
   use 'nacro90/numb.nvim'

   -- LSP
   use 'neovim/nvim-lspconfig'
   use 'williamboman/nvim-lsp-installer'
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
   }

   -- LSP cmp = autosuggestion
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'

   -- LSP cmp = snippets
   use 'L3MON4D3/LuaSnip'
   use 'saadparwaiz1/cmp_luasnip'
   use 'rafamadriz/friendly-snippets'
   use 'aca/emmet-ls'

   -- LSP other
   use 'onsails/lspkind.nvim'
   use 'ray-x/lsp_signature.nvim'
   use 'tami5/lspsaga.nvim'

   -- Text editing, autopairs
   use 'windwp/nvim-autopairs'
   use 'lukas-reineke/indent-blankline.nvim'

   use {
      'prettier/vim-prettier',
      run = 'yarn install --frozen-lockfile --production'
   }
   --use 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
   use 'lewis6991/gitsigns.nvim'
   use 'folke/trouble.nvim'

   -- Telescope navigation
   use 'nvim-lua/plenary.nvim'
   use 'nvim-telescope/telescope.nvim'
   use 'kyazdani42/nvim-web-devicons' -- Add icons to telescope

   -- Terminal in neovim
   use 'voldikss/vim-floaterm'
   use 'akinsho/toggleterm.nvim'

   -- Speed up neovim
   use 'lewis6991/impatient.nvim'
   use 'nathom/filetype.nvim'

   -- Comment
   use 'numToStr/Comment.nvim'

   -- Git
   use 'sindrets/diffview.nvim'

   -- Markdown
   use 'iamcco/markdown-preview.nvim'

   use 'dstein64/vim-startuptime'
end)
