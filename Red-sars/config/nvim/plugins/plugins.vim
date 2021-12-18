" Plugins Start
call plug#begin('~/.config/nvim/plugins/plugged')

   " For File Explorer
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' " For git status
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter'


   " icon
Plug 'ryanoasis/vim-devicons' " Icons without Colours

   " Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

   " Syntax Suggestions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
"Plug 'ervandew/supertab'

   " Colorations
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }

   " Ext For Developer
Plug 'turbio/bracey.vim' " Live Server
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'nikvdp/ejs-syntax'
Plug 'briancollins/vim-jst'
Plug 'chrisbra/colorizer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-commentary' " Commenter
Plug 'ianks/vim-tsx' " Auto coloring tsx file
Plug 'leafgarland/typescript-vim' " Auto coloring typescript file
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Require nodejs & yarn

   " For Funny
Plug 'mhinz/vim-startify'
"Plug 'glepnir/dashboard-nvim'

call plug#end()
