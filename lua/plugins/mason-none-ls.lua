return {
  "jay-babu/mason-null-ls.nvim",
  cmd = { "None" },
  opts = {
    automatic_installation = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "williamboman/mason.nvim", config = true },
    require("plugins.none-ls"),
  },
}
