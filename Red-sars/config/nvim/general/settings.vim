let g:mapleader = "\<Space>"
set title
set encoding=utf-8

" Global Settings
filetype plugin indent on     " allows auto-indenting depending on file type
syntax enable                 " syntax highlighting
set number relativenumber     " add line numbers

set wrap linebreak nolist

set t_Co=256
let base16colorspace=256

set mouse=a

set splitbelow splitright

set hlsearch                  " highlight search results

set autoindent                " indent a new line the same amount as the line just typed

set linespace=10

set cmdheight=1

" For Tab
set expandtab
set smarttab
set tabstop=3
set softtabstop=3
set shiftwidth=3

set laststatus=2

" For Split


" For Vim >=8.0 or Neovim >= 0.1.5
if(has("termguicolors"))
   set termguicolors
endif

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Terminal In Neovim
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" open terminal on ctrl+t
function! OpenTerminal()
   exec ':vsplit | terminal'
   exec ':set nonumber norelativenumber'
   exec ':startinsert'
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

" For Compile C++
function! CompileCpp()
   exec ":w"
   exec ':vsplit term://g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r'
   exec ':startinsert'
endfunction
nnoremap <F5> :call CompileCpp()<CR>

" For Bracey
nnoremap <M-l> :Bracey<CR>

" Auto Reload Bracey
function! SaveAndReload()
   exec ':w'
   exec ':BraceyReload'
endfunction
nnoremap <c-s> :call SaveAndReload()<CR>

" For Autocompiling Sass
autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"

" For NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
   " Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree

" For Bracey Live Server
let g:bracey_refresh_on_save = 1

" For Airline
let g:airline_theme='distinguished'
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_powerline_fonts=1
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_statusline = 1
   " Custom Symbols For Airline
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.spell = '暈'
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.whitespace = '並'

" For git plugin
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'ﮏ',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'留',
                \ 'Renamed'   :'',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'窱',
                \ 'Clean'     :'',
                \ 'Unknown'   :'?',
                \ }

" For Devicons
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1

" For Colorations
set background=dark
colorscheme aquarium

" For Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" For Auto Pairs
let g:AutoPairsFlyMode = 1

" For Sinppets
let g:UltiSnipsSnippetDirectories=[$HOME.'~/.config/nvim/snippets']

" For vim-gitgutter
highlight GitGutterAdd guifg=#70af85 ctermfg=green
highlight GitGutterChange guifg=#ffb52a ctermfg=yellow
highlight GitGutterDelete guifg=#bd2c40 ctermfg=red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1
" Use fontawesome icons as signs
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''
" Update sign column every quarter second
set updatetime=250

" For idenfying .ts and .tsx file
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" For Markdown preview
   " set to 1, nvim will open the preview window after entering the markdown buffer
   " default: 0
let g:mkdp_auto_start = 1
   " set to 1, the nvim will auto close current preview window when change
   " from markdown buffer to another buffer
   " default: 1
let g:mkdp_auto_close = 1
