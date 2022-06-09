call plug#begin()

" Themes
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'Mofiqul/dracula.nvim'

" NerdTree
Plug 'ryanoasis/vim-devicons' " NerdTree icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'

" Navigation 
Plug 'christoomey/vim-tmux-navigator'
Plug 'ggandor/lightspeed.nvim'
Plug 'SmiteshP/nvim-gps'
Plug 'nacro90/numb.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP cmp = autosuggestion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" LSP cmp = snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'aca/emmet-ls'

" LSP other 
Plug 'onsails/lspkind.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'tami5/lspsaga.nvim'

" Text editing, autopairs 
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'

" Telescope navigation
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Add icons to telescope

" Terminal in neovim 
Plug 'voldikss/vim-floaterm'
Plug 'akinsho/toggleterm.nvim'

" Speed up neovim
Plug 'lewis6991/impatient.nvim' 
Plug 'nathom/filetype.nvim'

" Comment
Plug 'numToStr/Comment.nvim'

" Git
Plug 'sindrets/diffview.nvim'

call plug#end()
