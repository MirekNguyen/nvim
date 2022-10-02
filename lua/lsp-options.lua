local formattingOff = function()
  return function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
end
local servers = {
  { name = "clangd" },
  { name = "bashls" },
  { name = "cssls" },
  { name = "sumneko_lua" },
  { name = "emmet_ls" },
  { name = "tailwindcss",
    filetypes = { "typescriptreact", "javascriptreact" }
  },
  -- set Null-ls formatting
  { name = "tsserver", on_attach = formattingOff() },
  { name = "html", on_attach = formattingOff() },
  { name = "jsonls", on_attach = formattingOff() },
  { name = "intelephense", on_attach = formattingOff() },
}
return servers
