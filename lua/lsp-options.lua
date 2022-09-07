local formattingOff = function()
  return function(client) client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end
local servers = {
  { name = "clangd" },
  { name = "bashls" },
  { name = "cssls" },
  { name = "sumneko_lua" },
  { name = "emmet_ls",
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  },
  { name = "tailwindcss",
    filetypes = { "html", "php", "css", "sass", "scss", "postcss", "less", "javascript", "javascriptreact", "typescript" },
  },
  -- set Null-ls formatting
  { name = "tsserver", on_attach = formattingOff() },
  { name = "html", on_attach = formattingOff() },
  { name = "jsonls", on_attach = formattingOff() },
  { name = "intelephense", on_attach = formattingOff() },
}
return servers
