return{
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
  }
