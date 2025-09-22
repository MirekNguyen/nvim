vim.diagnostic.config({
  severity_sort = true,
})

return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  keys = {
    { "ga", "<cmd>Lspsaga code_action<CR>" },
    { "gf", "<cmd>Lspsaga finder<CR>" },
    { "K",  "<cmd>Lspsaga hover_doc ++keep<CR>" },
    { "L",  "<cmd>Lspsaga peek_definition<CR>" },
    { "gr", "<cmd>Lspsaga rename ++project<CR>" },
    { "go", "<cmd>Lspsaga outline<CR>" },
    { "gd", "<cmd>Lspsaga goto_definition<CR>" },
    { "gi", "<cmd>Lspsaga finder imp<CR>" },
    { "M",  "<cmd>Lspsaga show_line_diagnostics<CR>" },
  },
  opts = {
    symbol_in_winbar = {
      enable = false,
    },
    lightbulb = {
      sign = false,
    },
  },
}
