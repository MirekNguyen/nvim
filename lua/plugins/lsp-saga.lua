function nmap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

nmap("gh", ":Lspsaga lsp_finder")
nmap("ca", ":Lspsaga code_action")
nmap("K", ":Lspsaga hover_doc")
nmap("gs", ":Lspsaga signature_help")
nmap("gr", ":Lspsaga rename")
nmap("gd", ":Lspsaga peek_definition")
nmap("[e", ":Lspsaga diagnostic_jump_prev")
nmap("]e", ":Lspsaga diagnostic_jump_next")
nmap("go", ":LSoutlineToggle")
nmap("cd", ":Lspsaga show_line_diagnostics")

local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.init_lsp_saga({
  symbol_in_winbar = {
    in_custom = true
  }
})
