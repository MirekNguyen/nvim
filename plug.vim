set nocompatible
call plug#begin()
" Nvim greeter
Plug 'glepnir/dashboard-nvim'

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Mofiqul/dracula.nvim'
" Plug 'tomasiser/vim-code-dark'

" NerdTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' "NerdTree git differences
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " NerdTree colors
Plug 'ryanoasis/vim-devicons' " NerdTree icons
Plug 'romgrk/barbar.nvim'

" Navigation 
Plug 'christoomey/vim-tmux-navigator'
Plug 'kyazdani42/nvim-tree.lua'

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
Plug 'rafamadriz/friendly-snippets' "Plug 'SirVer/ultisnips'

" LSP ultisnips
"Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"Plug 'mlaursen/vim-react-snippets'

" LSP other 
Plug 'onsails/lspkind.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'tami5/lspsaga.nvim'

" Text editing, autopairs 
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" Snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Telescope navigation
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Add icons to telescope

" Emment-ls
Plug 'aca/emmet-ls'

" Git in nvim
Plug 'tpope/vim-fugitive'

" Terminal in neovim 
Plug 'voldikss/vim-floaterm'
Plug 'akinsho/toggleterm.nvim'
call plug#end()
