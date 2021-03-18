call plug#begin('~/.vim/plugged')

" Plugin Color Scheme
Plug 'flazz/vim-colorschemes'

" vim-airline
Plug 'vim-airline/vim-airline'

" vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

" Shades Of Purple Color Scheme
Plug 'rigellute/shades-of-purple.vim'

" Solarized 8 Color Scheme
Plug 'lifepillar/vim-solarized8'

" vimtex
"Plug 'lervag/vimtex'

" NERDtree
Plug 'scrooloose/nerdtree'

" vim-devicon
Plug 'ryanoasis/vim-devicons'

" fzf
Plug 'junegunn/fzf'

"coc
Plug 'neoclide/coc.nvim'

"vim-prettier
Plug 'prettier/vim-prettier'

"vundle
Plug 'VundleVim/Vundle.vim'

"youcompleteme
Plug 'valloric/youcompleteme'

call plug#end()

"Custom command
set number
set incsearch
set noshowmode
set autoindent
set smartindent
"set completeopt=preview,menuone

"""" enable 24bit true color
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

"""" enable the theme
syntax enable
" colorscheme iceberg
set background=dark
autocmd vimenter * ++nested colorscheme solarized8

" For airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

