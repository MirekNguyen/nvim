" NvimTree keymaps
nnoremap <C-f> :NvimTreeFocus<CR>
noremap <C-h> :NvimTreeRefresh<CR>
nnoremap <C-l> :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>

" Telescope keymaps
nnoremap <silent>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" Floaterm keymaps
nnoremap <silent> <C-j> :FloatermToggle <CR>
let g:floaterm_keymap_toggle = '<C-j>'
