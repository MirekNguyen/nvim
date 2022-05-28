runtime ./plug.vim "include plugins
"set nvim§
syntax on
set shiftwidth=3
set mouse=a "mouse in vim
set number
set ignorecase "search in vim using '/' no case sensitive
set clipboard+=unnamedplus
" set tabstop=3 "setting tab width
" set paste " don't mess up the indenting of pasted text

" Vim Theme
colorscheme gruvbox 
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" SnipMate snippets autocomplete
let g:snipMate = { 'snippet_version' : 1 }

" NerdTree keymaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap  <silent> ff <cmd>lua require('telescope.builtin').find_files()<cr>

" vscode-like completion highlight
"set termguicolors
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
