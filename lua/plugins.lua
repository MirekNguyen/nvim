vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
   use 'wbthomason/packer.nvim'

   -- Themes
   use 'morhetz/gruvbox'
   use 'nvim-lualine/lualine.nvim'
   -- use 'Mofiqul/dracula.nvim'

   -- Nvim-tree
   use 'ryanoasis/vim-devicons' -- NerdTree icons
   use 'kyazdani42/nvim-tree.lua'
   use 'romgrk/barbar.nvim' -- tabs in neovim, nvim-tree

   -- Navigation
   use 'christoomey/vim-tmux-navigator' -- navigate between tmux and neovim seamlessly
   use 'ggandor/lightspeed.nvim' -- quickly navigate using 's' and 'S' keys
   use {
      "SmiteshP/nvim-gps", -- status line, location (e.g. demo.cpp > main > mystruct)
      requires = "nvim-treesitter/nvim-treesitter"
   }
   use 'nacro90/numb.nvim' -- peeks lines of buffer in non-obtrusive way

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
   use 'jiangmiao/auto-pairs' -- auto pair brackets, quotations
   use 'lukas-reineke/indent-blankline.nvim' -- add indentation guideline
   use 'tpope/vim-repeat' -- repeat last command, vim-surround
   use 'tpope/vim-surround' -- ability to change brackets, quotations
   use 'AndrewRadev/tagalong.vim' -- for editing HTML tags on both side
   use 'norcalli/nvim-colorizer.lua' -- visualize colors in html, css

   -- Code format, troubleshoot
   use {
      'prettier/vim-prettier',
      run = 'yarn install --frozen-lockfile --production'
   }
   use 'folke/trouble.nvim' -- navigate through warnings, errors

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
   use 'dstein64/vim-startuptime' -- check startup time

   -- Comment
   use 'numToStr/Comment.nvim'

   -- Git
   use 'sindrets/diffview.nvim'
   use 'lewis6991/gitsigns.nvim'

   -- Markdown
   use 'iamcco/markdown-preview.nvim'
end)
