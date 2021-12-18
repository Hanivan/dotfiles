" Keybindings
   " CTRL+b -- Open NERDTree --
nnoremap <C-b> :NERDTreeToggle<CR>

   " -- Switch Next&Previous Tab --
nnoremap <A-Tab> :BufferNext<CR>
nnoremap <A-S-Tab> :BufferPrevious<CR>
nnoremap <C-W> :BufferClose<CR>
" Re-order to previous/next
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>

   " CTRL+H/J/K/L -- Split Window --
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

   " Use <c-space> for trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

   " For Select Snippets
let g:UltiSnipsExpandTrigger="<TAB>"               
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

   " Open Telescope Find Files
nnoremap <C-p> :Telescope find_files theme=ivy<CR>

   " For resize vertical tab
nnoremap <C-z> :vertical resize +5<CR>
nnoremap <C-S-z> :vertical resize -5<CR>

   " For resize horizontal tab
nnoremap <C-x> :resize +5<CR>
nnoremap <C-S-x> :resize -5<CR>
