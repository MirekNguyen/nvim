runtime ./plug.vim "include plugins
runtime ./setup.vim "include setup
runtime ./map.vim
" Set vim variables
set mouse=a "mouse in vim
set number "numbered vim
set ignorecase "search in vim using '/' no case sensitive
set clipboard+=unnamedplus " sync clipboard
" Tab 
set shiftwidth=3
set tabstop=3
set expandtab
set smartindent
set smarttab
set noswapfile
set completeopt=menu,menuone,noselect
set nocompatible

" Vim theme
syntax on
set termguicolors
colorscheme gruvbox 


highlight link LspSagaFinderSelection Search
" vscode-like completion highlight
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

