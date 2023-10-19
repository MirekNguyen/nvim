return {
  servers = {
    texlab = {},
    bashls = {},
    pyright = {},
    clangd = {},
    cssls = {},
    emmet_ls = {},
    tailwindcss = { filetypes = { "typescriptreact", "javascriptreact" } },
    tsserver = {},
    html = {},
    jsonls = {},
    intelephense = { 
      init_options = { globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense' },
    },
    dockerls = {},
  },
  sources = function(null_ls)
    return {
      null_ls.builtins.formatting.prettierd.with({
        extra_args = function(params)
          return { "--tab-width=" .. params.options.tabSize }
        end,
      }),
      null_ls.builtins.diagnostics.phpcs.with({ extra_args = { "--standard=PSR12" } }),
      null_ls.builtins.formatting.phpcsfixer,
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,
    }
  end
}
