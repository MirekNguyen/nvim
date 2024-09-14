return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  keys = {
    { "ga", ":Lspsaga code_action<CR>" },
    { "gf", ":Lspsaga finder<CR>" },
    { "K",  ":Lspsaga hover_doc ++keep<CR>" },
    { "L",  ":Lspsaga peek_definition<CR>" },
    { "gr", ":Lspsaga rename<CR>" },
    { "go", ":Lspsaga outline<CR>" },
    { "gd", ":Lspsaga goto_definition<CR>" },
    { "M",  ":Lspsaga show_line_diagnostics<CR>" }
  },
  config = {
    symbol_in_winbar = {
      enable = false,
    },
    lightbulb = {
      sign = false,
    },
  },
}
