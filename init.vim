" Init.vim for NeoVim Configuration: Matthew J. Corbett 3/20/2021

" General Display Settings
 let mapleader = " " "Set Leader Key
 set nu               "line numbers
 set rnu              "relative line numbers
 set ruler            "show line local in bottom right
 syntax on            "code syntax (works for some)
 set noerrorbells     "Turns off sound when you hit end wall or line
 set vb t_vb=         "Turns off flashing && bell sounds
 set nowrap           "lines do not wrap down when going off the screen
 set colorcolumn=80   "Line of where to stop
 set background=dark  "Back Ground default to dark mode
 highlight ColorColumn ctermbg=0 guibg=lightgrey
 set cmdheight=2      "Give more space for displaying messages
 set nohlsearch       "Does not leave highlight after search
 set hidden
 set spell            " Activate Spell Check
 set spelllang=en_us  " Set language for the Spell Check
 set autoread
 set cursorline       " Highlight Current Line
 " set cursorcolumn   " Highlight Current Column

" Json comments display fix
 autocmd FileType json syntax match Comment +\/\/.\+$+

" Internal Settings
 set incsearch                   "Searching will happen as you type
 set noswapfile                  "No swap files in Dir when editing
 set ignorecase                  "Ignore caps
 set smartcase                   "automatic case sensitive search until cap added
 set nobackup                    "no backup files created
 set undodir=~/.config/nvim/undodir      "Local of Undo History to get old versions back
 set undofile                    "Set the undofile system to true
 set termguicolors               "Enable Gui Colors
 set scrolloff=8                 "Set the number of lines kept from top/bottom
 set updatetime=50               "Longer time on each update
 set shortmess+=c                "Don't pass messages to |ins-completion-menu|.
 set backspace=indent,eol,start  "Fix backspace issues in some terminals
 autocmd BufWritePre * %s/\s\+$//e   "Remove Trailing White Space on save
 set encoding=utf-8              " Set the Encoding just in case

 " Tabs
 set expandtab                    "Convert from tab to spaces
 set smarttab                     "Unknown Yet ....
 set smartindent                  "Auto Indent in Code
 set shiftwidth=4                 "Arrow over is only 4 spaces long and not 8
 set tabstop=4 softtabstop=4      "Tab is only 4 characters long
 set autoindent                   "Auto Indent

" Disable Arrow Keys
 map <Up> <NOP>
 map <Down> <NOP>
 map <Left> <NOP>
 map <Right> <NOP>

"Fix tabing issue in Vmode
 vmap < <gv
 vmap > >gv

" Netrw Settings
 let g:netrw_liststyle=3
 let g:netrw_browse_split=2
 let g:netrw_banner=0
 let g:netrw_winsize=25

" Plug-Ins (Managed by Vim-Plug) ----------------------------------------
 call plug#begin('~/.config/nvim/plugged')
 " Searching
 Plug 'mbbill/undotree'
 " Git intergration
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 " Autocompleters
 Plug 'tpope/vim-commentary'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
 Plug 'mattn/emmet-vim'
 " Status Bar
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
" Color Schemes
 Plug 'jackguo380/vim-lsp-cxx-highlight'
 Plug 'flazz/vim-colorschemes'
 Plug 'sainnhe/gruvbox-material'
 Plug 'morhetz/gruvbox'
 call plug#end()

" Color Scheme Settings -------------------------------------------------
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

"Remappings--------------------------------------------------------------
" Easy way to Exit modes
 inore jj <esc>
 vnore nn <esc>
" Window Movements
 nnoremap <A-h> :wincmd h<CR>
 nnoremap <A-j> :wincmd j<CR>
 nnoremap <A-k> :wincmd k<CR>
 nnoremap <A-l> :wincmd l<CR>
" Resize Window
 nnoremap <A-=> :vertical resize +5<CR>
 nnoremap <A--> :vertical resize -5<CR>
" Open Navigation Bar
 nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" Open new terminal
 nnoremap <leader>t :term<CR>
" Searching
" TODO: Install FZF
" Open Undo Tree
 nnoremap <Leader>u :UndotreeShow<CR><A-h>
" Exit Vim Quickly
 nnoremap qq :q<CR>
" Alias Replacing
 nnoremap S :%s//gI<Left><Left><Left>
" Save File
 nnoremap <C-s> :w<CR>
 " Source Files
 nnoremap <A-s> :source %<CR>

 " Vim Commentary Settings -----------------------------------------------

 " Fugitive Settings -----------------------------------------------------
 nmap Gl :G log <CR>
 nmap Gd :G diff <CR>
 nmap GD :Gdiffsplit<CR>
 nmap Ga :G add .<CR>
 nmap Gc :G commit<CR>
 nmap GC :G checkout<SPACE>
 nmap GG :G<CR>
 nmap GP :G push<CR>

 " Git Gutter Settings ---------------------------------------------------
 let g:gitgutter_map_keys = 0
 let g:gitgutter_enabled = 1
 let g:gitgutter_max_signs = -1
 highlight GitGutterAdd    guifg=#009900 ctermfg=2
 highlight GitGutterChange guifg=#fcfc05 ctermfg=3
 highlight GitGutterDelete guifg=#fc030b ctermfg=0
 let g:gitgutter_sign_removed = '_'

 " Emmet Settings --------------------------------------------------------
 let g:user_emmet_leader_key='<S-z>'
 " commands:
 " k = remove all in tag
 " d = highlight parent
 " D = highlight child
 " n = next space
 " / = comment out tag
 " a = create a tag from URL


" Coc Settings -----------------------------------------------------------
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

" Use tab for trigger completion with characters ahead and navigate.
 inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
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

" Coc-Actions
" Remap for do codeAction of selected region
" leadera --> for current selected range
" leader aw --> current word
" leader aas --> current sentance
" leader aap --> current paragraph
function! s:cocActionsOpenSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" VimLSP
" Document Highlight
let g:markdown_fenced_languages = [
    \ 'vim',
    \ 'help'
    \]
"To make pressing enter automatically choose the first option
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Vim Airline Settings -----------------------------------------------------
" Enable Tabs for all buffers when there is only one tab open
let g:airline#extensions#tabline#enabled = 1
" Set mode of tabline //default//unique_tail//jsformatter//unique_tail_improved
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Setting the color schemes
let g:airline_theme='base16_gruvbox_dark_hard'
