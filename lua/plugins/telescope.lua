return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>g", "<cmd>Telescope live_grep<CR>",                                          desc = "Live grep" },
    { "<leader>b", "<cmd>Telescope buffers<CR>",                                            desc = "Buffers" },
    { "<D-j>",     "<cmd>Telescope telescope_path<CR>",                                     desc = "Files in ~" },
    { "<D-J>",     "<cmd>Telescope telescope_path_forward<CR>",                             desc = "Forward files" },
    { "<D-l>",     "<cmd>lua require'telescope.builtin'.git_files{show_untracked=true}<CR>" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,              -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case",  -- or "ignore_case" or "respect_case"
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
