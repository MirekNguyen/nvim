local parsers_to_install = {
  "bash", "c", "c_sharp", "cpp", "css", "fish", "html", "java",
  "javascript", "json", "lua", "php", "phpdoc", "python", "scss",
  "tsx", "typescript", "vim", "yaml", "markdown", "markdown_inline",
  "twig", "sql", "xml", "rust", "gitignore", "dockerfile", "svelte",
  "toml", "requirements", "prisma", "http", "graphql", "go", "nix", "swift",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "VeryLazy" },
  build = ":TSUpdate",
  config = function()
    local nvim_treesitter = require("nvim-treesitter")

    nvim_treesitter.install(parsers_to_install)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true }),
      callback = function(event)
        pcall(vim.treesitter.start, event.buf)
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
