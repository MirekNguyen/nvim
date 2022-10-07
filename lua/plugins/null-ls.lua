local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      extra_args = function(params)
        return { "--tab-width=" .. params.options.tabSize }
      end,
    }),
    null_ls.builtins.diagnostics.phpcs.with({ extra_args = { "--standard=PSR12" } }),
    null_ls.builtins.formatting.phpcsfixer,
  }
})
