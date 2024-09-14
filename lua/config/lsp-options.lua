return {
  servers = {
    helm_ls = {},
    omnisharp = {},
    texlab = {},
    bashls = { filetypes = { "sh", "bash", "zsh", "fish" } },
    pyright = {},
    clangd = {
      cmd = { "clangd", "--offset-encoding=utf-16" },
    },
    cssls = {},
    eslint = {},
    emmet_language_server = {
      filetypes = {
        "css",
        "eruby",
        "html",
        "htmldjango",
        "javascriptreact",
        "less",
        "pug",
        "sass",
        "scss",
        "typescriptreact",
        "twig",
        "blade",
      },
      init_options = {
        showSuggestionsAsSnippets = true,
      },
    },
    tailwindcss = { filetypes = { "typescriptreact", "javascriptreact" } },
    svelte = {},
    ts_ls = {},
    html = {
      filetypes = { "html", "twig", "blade", "latte" },
    },
    jsonls = {
      settings = {
        json = {
          schemas = {
            {
              fileMatch = { "package.json" },
              url = "https://json.schemastore.org/package.json",
            },
            {
              fileMatch = { "turbo.json" },
              url = "https://turbo.build/schema.json",
            },
            {
              fileMatch = { "tsconfig.json" },
              url = "https://json.schemastore.org/tsconfig.json",
            },
            {
              fileMatch = { ".prettierrc", ".prettierrc.json" },
              url = "https://json.schemastore.org/prettierrc.json",
            },
            {
              fileMatch = { "nodemon.json" },
              url = "https://json.schemastore.org/nodemon.json",
            },
            {
              fileMatch = { "nest-cli.json" },
              url = "https://json.schemastore.org/nest-cli.json",
            },
          },
        },
      },
    },
    intelephense = {
      init_options = {
        globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
        licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
      },
    },
    dockerls = {},
    docker_compose_language_service = {},
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          hint = {
            enable = false,
          },
        },
      },
    },
    rust_analyzer = {},
    yamlls = {
      settings = {
        yaml = {
          schemas = {
            ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
            "*gitlab-ci*.{yml,yaml}",
            ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/all.json"] =
            "/*.k8s.{yaml,yml}",
          },
          format = {
            enable = true,
            singleQuote = true,
            bracketSpacing = true,
          },
          validate = true,
          hover = true,
          completion = true,
        },
      },
    },
    taplo = {},
    sqlls = {},
    gopls = {},
    prismals = {},
    nginx_language_server = {},
  },
  sources = function(null_ls)
    return {
      null_ls.builtins.formatting.prettierd.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "jsonc",
          "yaml",
          "graphql",
          "handlebars",
        },
        extra_args = {
          "--single-quote",
        },
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.expand(
            "/Users/mireknguyen/.local/projects/personal/calorie-tracker-be/.prettierrc"
          ),
        },
      }),
      null_ls.builtins.formatting.mdformat,
      -- php
      null_ls.builtins.diagnostics.phpcs.with({
        extra_args = { "--standard=PSR12", "--exclude=Generic.WhiteSpace.DisallowTabIndent" },
      }),
      null_ls.builtins.formatting.phpcbf.with({
        command = "/Users/mireknguyen/.local/projects/work/omnichannel/vendor/bin/phpcbf",
        args = {
          "-q",
          "--standard=/Users/mireknguyen/.local/projects/work/omnichannel/phpcs.xml",
          "--stdin-path=$FILENAME",
          "-",
        },
      }),
      null_ls.builtins.diagnostics.phpstan,
      null_ls.builtins.diagnostics.twigcs,
      null_ls.builtins.formatting.blade_formatter,
      -- sql
      null_ls.builtins.formatting.sql_formatter.with({
        filetypes = { "sql", "mysql", "pgsql", "sqlite" },
        extra_args = { "--config", '{"keywordCase": "upper"}' },
      }),
      -- bash
      null_ls.builtins.formatting.shellharden,
      -- python
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,
      -- lua
      null_ls.builtins.formatting.stylua,
      -- other
      null_ls.builtins.formatting.nginx_beautifier,
      null_ls.builtins.diagnostics.dotenv_linter,
      null_ls.builtins.diagnostics.hadolint,
      null_ls.builtins.diagnostics.markdownlint,
    }
  end,
}