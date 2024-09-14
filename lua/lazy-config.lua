local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", -- edit zip files
        -- "matchit", -- match XML tags using '%'
        -- "matchparen", -- highlight matching brackets
        -- "netrwPlugin",
        "tarPlugin", -- edit tar files
        "tohtml",
        "tutor",
        "zipPlugin",
        -- "rplugin", -- remote plugins
        "spellfile",
        "man", -- ':Man' command (man pages)
        "shada", -- search, command history, marks
        "health", -- ':checkhealth' command
      },
    },
  },
  defaults = { lazy = true },
})
