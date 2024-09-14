local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
return require("lazy").setup({
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
    lazy = false,
  },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup()
  --   end,
  --   lazy = false,
  -- },
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPT", "ChatGPTRun" },
    config = function()
      require("chatgpt").setup({
        chat = {
          openai_params = {
            model = "gpt-4o-2024-08-06",
            max_tokens = 4096,
          },
          openai_edit_params = {
            model = "gpt-4o-2024-08-06",
          },
          keymaps = {
            select_session = "o",
          },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    config = true,
    filetypes = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      openai_model_id = "gpt-4o-2024-08-06",
    },
    cmd = { "Wtf", "WtfSearch" },
  },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {
      view_options = {
        show_hidden = true,
      }
    }
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    config = function()
      vim.g.db_ui_show_help = 0
      vim.api.nvim_create_autocmd({ "BufReadPost" }, {
        pattern = { "*.dbout" },
        callback = function()
          vim.api.nvim_exec2(
            [[
        exe ':resize 40'
        ]],
            {}
          )
        end,
      })
      vim.api.nvim_create_autocmd({ "BufReadPost" }, {
        pattern = { "*.dbout" },
        callback = function()
          vim.api.nvim_exec2(
            [[
        exe ':resize 20'
        ]],
            {}
          )
        end,
      })
    end,
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = true,
    opts = {
      hint_enable = false,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
    lazy = false,
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    config = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          telescope_path = {
            search_dir = "$HOME",
            ignore_file = "$HOME/.config/dotfiles/config/fdignore",
          },
        },
      })
      require("telescope").load_extension("telescope_path")
      require("telescope").load_extension("fzf")
    end,
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mireknguyen/telescope-path.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.treesitter")
    end,
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "Mason", "LspInstall", "LspUninstall", "LspInfo" },
    config = function()
      require("plugins.lsp")
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        config = true,
        opts = { automatic_installation = true },
        dependencies = {
          "williamboman/mason.nvim",
          config = true,
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.lsp-cmp")
    end,
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("plugins.luasnip")
        end,
      },
      { "onsails/lspkind.nvim" },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "nvimtools/none-ls.nvim",
    -- event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    config = function()
      require("plugins.null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
        lightbulb = {
          sign = false,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = true,
        auto_refresh = true, -- auto refresh panel
        layout = {
          position = "right", -- | top | left | right
          ratio = 0.4,   -- width of the panel, when position is left or right
        },
      },
      suggestion = {
        enabled = true,  -- enable suggestions
        auto_trigger = true, -- automatically show suggestions
        accept = false,  -- disable built-in keymapping
        keymap = {
          accept = "<C-f>",
          next = "<C-;>",
          prev = "<C-'>",
          dismiss = "<C-\\>",
        },
      },
    },
  },
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
        -- "rplugin", -- remote plugins
        "spellfile",
        "man", -- ':Man' command (man pages)
        "shada", -- search, command history, marks
        "health", -- ':checkhealth' command
      },
    },
  },
  defaults = { lazy = true },
})
