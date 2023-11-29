# Introduction
My blazingly fast neovim configuration. Most plugins are lazy loaded.

# Requirements

- Neovim - latest stable version
- C compiler for nvim-treesitter - clangd, gcc
- npm for mason.nvim
- git
- curl or wget

## Optional dependencies

- Telescope support (optional)
    - fd
    - fzf
    - rg
    - bat
# Installation

- optionally replace `$HOME` with `$XDG_CONFIG_HOME`
```
git clone https://github.com/MirekNguyen/nvim "$HOME/.config/nvim"
```

# Installation of dependencies

- MacOS
```
brew update && brew install fd-find fzf ripgrep nvim node bat
```
- Linux Fedora
```
dnf update && dnf install fd-find fzf ripgrep nvim node bat gcc-c++
```
