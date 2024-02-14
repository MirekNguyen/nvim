return {
  servers = {
    texlab = {},
    bashls = {},
    pyright = {},
    clangd = {
       cmd = { "clangd", "--offset-encoding=utf-16" }
    },
    cssls = {},
    eslint = {},
    emmet_language_server = {
      filetypes = { "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "typescriptreact", "twig", "blade" },
      init_options = {
        showSuggestionsAsSnippets = true,
      }
    },
    tailwindcss = { filetypes = { "typescriptreact", "javascriptreact" } },
    svelte = {},
    tsserver = {},
    html = {
      filetypes = { "html", "twig", "blade" }
    },
    jsonls = {},
    intelephense = {
      init_options = {
        globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense',
        licenceKey = os.getenv('INTELEPHENSE_LICENCE_KEY'),
      },
    },
    dockerls = {},
    docker_compose_language_service = {},
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'},
          },
        },
      },
    },
    rust_analyzer = {},
    yamlls = {},
    taplo = {},
    sqlls = {},
    gopls = {},
  },
  sources = function(null_ls)
    return {
      null_ls.builtins.formatting.prettierd.with({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "graphql", "handlebars" },
      }),
      null_ls.builtins.formatting.mdformat,
      -- php
      null_ls.builtins.diagnostics.phpcs.with({ extra_args = { "--standard=PSR12" } }),
      null_ls.builtins.formatting.phpcsfixer.with({ extra_args = { "--using-cache=no" } }),
      null_ls.builtins.diagnostics.phpstan,
      null_ls.builtins.diagnostics.twigcs,
      null_ls.builtins.formatting.blade_formatter,
      null_ls.builtins.formatting.pint,
      -- bash
      null_ls.builtins.code_actions.shellcheck,
      -- null_ls.builtins.diagnostics.shellcheck,
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
