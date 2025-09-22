return {
  "imNel/monorepo.nvim",
  keys = {
    { "<D-u>", "<cmd>Telescope monorepo<cr>", desc = "Monorepo" },
  },
  opts = {},
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
}
