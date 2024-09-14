return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  keys = {
    { "ga", "<cmd>Lspsaga code_action<CR>" },
    { "gf", "<cmd>Lspsaga finder<CR>" },
    { "K",  "<cmd>Lspsaga hover_doc ++keep<CR>" },
    { "L",  "<cmd>Lspsaga peek_definition<CR>" },
    { "gr", "<cmd>Lspsaga rename<CR>" },
    { "go", "<cmd>Lspsaga outline<CR>" },
    { "gd", "<cmd>Lspsaga goto_definition<CR>" },
    { "M",  "<cmd>Lspsaga show_line_diagnostics<CR>" },
    { "gi", "<cmd>lua vim.lsp.buf.implementation({buffer=bufnr})<CR>" },
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
