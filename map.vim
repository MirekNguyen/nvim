" NvimTree keymaps
nnoremap <C-f> :NvimTreeFocus<CR>
nnoremap <C-k> :NvimTreeRefresh<CR>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-h> :NvimTreeFindFile<CR>

" Telescope keymaps
nnoremap <silent>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" Floaterm keymaps
nnoremap <silent> <C-j> :FloatermToggle <CR>
nnoremap <silent> <C-,> :ToggleTerm <CR>
nnoremap <silent><C-z> :TroubleToggle<CR>
let g:floaterm_keymap_toggle = '<C-j>'
