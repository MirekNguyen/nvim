local function config()
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  -- Setup nvim-cmp.
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "vim-dadbod-completion" },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    -- experimental = {
    --   ghost_text = true,
    -- },
    view = { entries = "custom" },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-a>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
  })

  -- VSCode highlight
  -- local function vcom(command) vim.api.nvim_command(command) end
  --
  -- vcom("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
  -- vcom("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
  -- vcom("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6")
  -- vcom("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
  -- vcom("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE")
  -- vcom("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE")
  -- vcom("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
  -- vcom("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0")
  -- vcom("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
  -- vcom("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4")
  -- vcom("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4")

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
      require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
    end,
  })

  vim.g.completion_chain_complete_list = {
    sql = {
      { complete_items = { "vim-dadbod-completion" } },
    },
  }
  vim.g.completion_matching_strategy_list = { "exact", "substring" }
  vim.g.completion_matching_ignore_case = 1
end

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = config,
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
    },
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
  },
}
