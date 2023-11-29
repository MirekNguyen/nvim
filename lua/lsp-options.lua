return {
  servers = {
    texlab = {},
    bashls = {},
    pyright = {},
    clangd = {},
    cssls = {},
    emmet_ls = {
      filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue", "twig" }
    },
    tailwindcss = { filetypes = { "typescriptreact", "javascriptreact" } },
    tsserver = {},
    html = {
      filetypes = { "html", "twig" }
    },
    jsonls = {},
    intelephense = {
      init_options = { globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense' },
    },
    dockerls = {},
    lua_ls = {},
    rust_analyzer = {},
    yamlls = {},
    sqlls = {},
  },
  sources = function(null_ls)
    return {
      null_ls.builtins.formatting.prettierd.with({
        extra_args = function(params)
          return { "--tab-width=" .. params.options.tabSize }
        end,
      }),
      -- php
      null_ls.builtins.diagnostics.phpcs.with({ extra_args = { "--standard=PSR12" } }),
      null_ls.builtins.formatting.phpcsfixer.with({ extra_args = { "--using-cache=no" } }),
      null_ls.builtins.diagnostics.twigcs,
      -- bash
      null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.diagnostics.shellcheck,
      -- python
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,
      -- rust
      null_ls.builtins.formatting.rustfmt,
      -- lua
      null_ls.builtins.formatting.stylua,
    }
  end
}
