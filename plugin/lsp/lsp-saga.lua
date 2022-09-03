local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.init_lsp_saga()

function nmap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command .. '<CR>', { noremap = true, silent = true })
end

nmap("gh", ":Lspsaga lsp_finder")
nmap("gd", ":Lspsaga preview_definition")
nmap("ca", ":Lspsaga code_action")
-- Hover Doc
nmap("K", ":Lspsaga hover_doc")
-- nmap("<C-u>", ":lua require('lspsaga.action').smart_scroll_with_saga(1)")
-- nmap("<C-i>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1)")
--
nmap("gs", ":Lspsaga signature_help")
nmap("gr", ":Lspsaga rename")
nmap("gd", ":Lspsaga preview_definition")
nmap("[e", ":Lspsaga diagnostic_jump_prev")
nmap("]e", ":Lspsaga diagnostic_jump_next")
nmap("go", ":LSoutlineToggle")
nmap("cd", ":Lspsaga show_line_diagnostics")
