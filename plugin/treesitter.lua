require 'nvim-treesitter.configs'.setup {
   ensure_installed = { "bash", "c", "c_sharp", "cpp", "css", "fish", "html", "java", "javascript", "json", "lua", "php",
      "python", "scss", "tsx", "typescript", "vim", "yaml", "markdown" },
   highlight = {
      enable = true,
      disable = {},
   },
   indent = {
      enable = true,
      disable = {},
   },
   autotag = {
      enable = true,
   }
}
