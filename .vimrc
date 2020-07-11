let mapleader = " " "Set Leader Key
" General Display Settings for Vim
set nu               "line numbers
set rnu              "relative line numbers
set ruler            "show line local in bottom right
syntax on            "code syntax (works for some langs, may need extention)
set noerrorbells     "Turns off sound when you hit end wall or line
set vb t_vb=         "Turns off flashing && bell sounds
set nowrap           "lines do not wrap down when going off the screen
set colorcolumn=80   "Line of where to stop
set background=dark  "BackGround default to dark mode
highlight ColorColumn ctermbg=0 guibg=lightgrey
set cmdheight=2      "Give more space for displaying messages
set nohlsearch
set hidden
set spell                 " Activate Spell Check
set spelllang=en_us,fr_ch "Set language for the Spellchecker
set autoread
set cursorline            " Highlight Current Line
"set cursorcolumn          " Highlight Current Column

"Json comments display
autocmd FileType json syntax match Comment +\/\/.\+$+

" Internal Settings
set incsearch                   "Searching will happen as you type
set noswapfile                  "No swap files in Dir when editing
set ignorecase                  "Ignore caps
set smartcase                   "automatic case sensitive search until cap added
set nobackup                    "no backup files created
set undodir=~/.vim/undodir      "Local of Undo History to get old versions back
set undofile                    "Set the undofile system to true
set termguicolors               "Enable Gui Colors
set scrolloff=8                 "Set the number of lines kept from top/bottom
set updatetime=50               "Longer time on each update
set shortmess+=c                "Don't pass messages to |ins-completion-menu|.
set backspace=indent,eol,start  "Fix backspace issues in some terminals
autocmd BufWritePre * %s/\s\+$//e   "Remove Trailing White-Space on save
set encoding=utf-8              " Set the Encoding just in case

" Tabs
set expandtab                    "Convert from tab to spaces
set smarttab                     "Unknown Yet ....
set smartindent                  "Auto Indenttation in Code
set shiftwidth=4                 "Arroy over is only 4 spaces long and not 8
set tabstop=4 softtabstop=4      "Tab is only 4 characters long
set autoindent                   "Auto Indent Activated

" Fix Issue of entering in REPLACE mode in WSL
if $TERM =~ 'xterm-256color'
      set noek
endif

" Disable Arroy Keys
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

" Netrw Settings
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

"Automaticly install Vim-Plug if not already in the system
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug-Ins (Managed by Vim-Plug) ----------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
" Plug 'valloric/youcompleteme' "currently not working
" Plug 'lyuts/vim-rtags'
" Color Schemes
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'flazz/vim-colorschemes'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
call plug#end()

" Color Scheme Settings -------------------------------------------------
colorscheme gruvbox
"Ones I like --> Dim, Red, DimRed, gruvbox (best one)
let g:gruvbox_contrast_dark = 'hard'

" Rip-Grep Settings -----------------------------------------------------
" Allows rg to always detect the root
if executable('rg')
        let g:rg_derive_root='true'
endif

" CTRL-P Settings -------------------------------------------------------
" Ignores Certain git files while searching
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exlude-standard']
" ag is fast enough that CtrlP dose not need to Cashe
let g:ctrlp_use_caching=0

"Remappings--------------------------------------------------------------
" Easy way to Exit modes
inore jj <esc>
inore JJ <esc>
vnore nn <esc>
vnore NN <esc>
" Make a line a comment
nnoremap <Leader>c <S-i>" <esc>
" Undo a line comment
nnoremap <Leader>C <S-i><esc>xx
" Window Movments
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
" Open Nav Bar
nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>B :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Searching
"Currently not working
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pf :Files<CR>
" Working
nnoremap <C-p> :GFiles<CR>

" Resize Window
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" Open Undo Tree
nnoremap <Leader>u :UndotreeShow<CR><Leader>h
" Exit Vim Quickly
nnoremap qq :q<CR>
" Alias Replacing
nnoremap S :%s//gI<Left><Left><Left>
" Save File
nnoremap <C-s> :w<esc>

" Coc Settings ----------------------------------------------------------
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
        set signcolumn=number
else
        set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"To make pressing enter automaticly choose the first option
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Vim Airline Settings -----------------------------------------------------
"Enable Tabs for all buffers when there is only one tab open
let g:airline#extensions#tabline#enabled = 1
"Set mode of tabline //default//unique_tail//jsformatter//unique_tail_improved
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Setting the color schemes
let g:airline_theme='base16_gruvbox_dark_hard'






