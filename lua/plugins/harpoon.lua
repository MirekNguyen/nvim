return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  branch = "harpoon2",
  keys = {
    { "<leader>1", ":lua require('harpoon'):list():select(1)<CR>" },
    { "<leader>2", ":lua require('harpoon'):list():select(2)<CR>" },
    { "<leader>3", ":lua require('harpoon'):list():select(3)<CR>" },
    { "<leader>4", ":lua require('harpoon'):list():select(4)<CR>" },
    { "<leader>5", ":lua require('harpoon'):list():select(5)<CR>" },
    { "<leader>a", ":lua require('harpoon'):list():add()<CR>" },
    { "<leader>s", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>" },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
}
