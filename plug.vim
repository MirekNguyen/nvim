set nocompatible
call plug#begin()
" Using Vim-Plug:
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

"Navigation 
Plug 'christoomey/vim-tmux-navigator'

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
"Plug 'SirVer/ultisnips'
"Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" LSP other 
Plug 'onsails/lspkind.nvim'
Plug 'glepnir/lspsaga.nvim'

" Autopairs
Plug 'windwp/nvim-autopairs'

" Snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Telescope navigation
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Add icons to telescope

call plug#end()
