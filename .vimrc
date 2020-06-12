" Vim Rc File 

let mapleader = " " "Set Leader Key 

" General Display Settings for Vim 
set nu               "line numbers
set rnu              "relative line numbers
set ruler            "show line local in bottom right 
syntax on            "code syntax (works for some langs, may need extention)
set noerrorbells     "Turns off sound when you hit end wall or line 
set nowrap           "lines do not wrap down when going off the screen
set colorcolumn=80   "Line of where to stop 
set background=dark  "BackGround default to dark mode 
highlight ColorColumn ctermbg=0 guibg=lightgrey
set cmdheight=2      "Give more spcace for displaying messages 

"Json comments display 
  autocmd FileType json syntax match Comment +\/\/.\+$+

" Internal Settings  
set incsearch               "Searching will happen as you type 
set noswapfile              "No swap files in Dir when editing
set smartcase               "automatic case sensitive search until cap added 
set nobackup                "no backup files created 
set undodir=~/.vim/undodir  "Local of Undo History to get old versions back 
set undofile
set termguicolors
set scrolloff=8

" Tabs 
set expandtab                    "Convert from tab to spaces 
set smarttab                     "Unknown Yet ....
set smartindent                  "Auto Indenttation in Code 
set shiftwidth=4                 "Arroy over is only 4 spaces long and not 8
set tabstop=4 softtabstop=4      "Tab is only 4 characters long 
set autoindent                   "Auto Indent Activated 

" Disable Arroy Keys 
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

" Easy way to Exit insert mode 
inore jj <esc>

" Plug-Ins (Managed by Vim-Plug) 
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" extentions used: coc-snippits, coc-json, coc-css, coc-html, coc-tsserver, coc-python, coc-cland
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'lyuts/vim-rtags' "currently not working 
Plug 'mbbill/undotree'
Plug 'valloric/youcompleteme' "currently not working 
Plug 'kien/ctrlp.vim'

call plug#end()


" Color Scheme Settings 
colorscheme gruvbox  "Set Color Scheme
let g:gruvbox_contrast_dark = 'hard'


" Allows rg to always detect the root 
if executable('rg')
    let g:rg_derive_root='true'
endif

" Ignores Certain git files while searching  
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exlude-standard']

" Opening a File System 
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" ag is fast enough that CtrlP dose not need to Cashe 
let g:ctrlp_use_caching=0







