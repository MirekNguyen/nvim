local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Dependency
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'

  -- Themes
  use 'lifepillar/vim-gruvbox8'
  use { 'nvim-lualine/lualine.nvim', config = function() require('plugins.lualine') end, event = "BufReadPre" }

  -- Navigation
  use { 'kyazdani42/nvim-tree.lua', config = function() require('plugins.nvim-tree') end, cmd = { 'NvimTreeToggle' } }
  use { 'romgrk/barbar.nvim', config = function() require('plugins.barbar') end, event = "BufReadPre" } -- tabs in neovim, nvim-tree
  use { 'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require('plugins.treesitter') end,
    event = "BufRead"
  }
  use { 'nvim-telescope/telescope.nvim', cmd = "Telescope" } -- telescope navigation

  -- LSP
  use { 'neovim/nvim-lspconfig', config = function() require('plugins.lsp') end, after = 'nvim-lsp-installer' }
  use { 'williamboman/nvim-lsp-installer', config = function() require('plugins.lsp-installer') end,
    after = "cmp-nvim-lsp" }

  -- LSP cmp = autosuggestion
  use { 'hrsh7th/nvim-cmp',
    config = function() require('plugins.lsp-cmp') end,
    event = "InsertEnter",
    requires = {
      { 'L3MON4D3/LuaSnip', config = function() require('plugins.luasnip') end, event = 'InsertEnter' },
      { 'onsails/lspkind.nvim', event = 'InsertEnter' }
    }
  }
  use { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" }
  use { 'hrsh7th/cmp-buffer', after = "nvim-cmp" }
  use { 'hrsh7th/cmp-path', after = "nvim-cmp" }
  use { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" }
  use { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" }

  -- LSP other
  use { 'ray-x/lsp_signature.nvim', config = function() require('plugins.lsp-signature') end, after = 'nvim-lspconfig' }
  use({ "glepnir/lspsaga.nvim", branch = "main", config = function() require('plugins.lsp-saga') end,
    after = "nvim-lspconfig" })

  -- Text editing, autopairs
  use { 'jiangmiao/auto-pairs', event = "BufWinEnter" } -- auto pair brackets, quotations
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugins.indent-blankline') end,
    event = "BufRead" } -- add indentation guideline
  use { 'tpope/vim-repeat', event = "BufWinEnter" } -- repeat last command, vim-surround
  use { 'tpope/vim-surround', event = "BufWinEnter" } -- ability to change brackets, quotations
  use { 'AndrewRadev/tagalong.vim', event = "BufWinEnter" } -- for editing HTML tags on both side
  use { 'norcalli/nvim-colorizer.lua', cmd = "ColorizerToggle" } -- visualize colors in html, css

  -- Code format, troubleshoot
  use { 'prettier/vim-prettier', cmd = "Prettier" }
  use { 'folke/trouble.nvim', config = function() require('plugins.trouble') end, cmd = "TroubleToggle" } -- navigate through warnings, error_message
  use { 'numToStr/Comment.nvim', config = function() require('plugins.comment') end, event = 'BufWinEnter' }
  use { 'jose-elias-alvarez/null-ls.nvim', config = function() require('plugins.null-ls') end, after = 'nvim-lspconfig' }

  -- Terminal in neovim
  use { 'voldikss/vim-floaterm', cmd = "FloatermToggle" }

  -- Speed up neovim
  use { 'lewis6991/impatient.nvim', config = function() require('plugins.impatient') end }
  use 'nathom/filetype.nvim'
  use 'dstein64/vim-startuptime' -- check startup time

  -- Git
  use { 'lewis6991/gitsigns.nvim',
    opt = true,
    event = 'BufWinEnter',
    config = function() require('plugins.gitsigns') end,
  }

  -- Markdown
  use { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end }
  -- Optional
  -- use 'ggandor/lightspeed.nvim' -- quickly navigate using 's' and 'S' keys
  -- use 'nacro90/numb.nvim' -- peeks lines of buffer in non-obtrusive way
  -- use 'christoomey/vim-tmux-navigator' -- navigate between tmux and neovim seamlessly
  -- use 'sindrets/diffview.nvim'
  -- use 'akinsho/toggleterm.nvim'
  -- use {"SmiteshP/nvim-gps", -- status line location (e.g. demo.cpp > main > mystruct) requires = "nvim-treesitter/nvim-treesitter"}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
