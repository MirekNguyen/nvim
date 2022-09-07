local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      extra_args = function(params)
        return { "--tab-width=" .. params.options.tabSize }
      end,
    }),
    -- Prettier must be installed externally, not with Mason, to properly work with 'php' files
    -- npm i -g prettier @prettier/plugin-php
    null_ls.builtins.formatting.prettier.with({
      extra_args = function(params)
        return { "--tab-width=" .. params.options.tabSize }
      end,
      filetypes = { "php" }
    }),
  }
})
