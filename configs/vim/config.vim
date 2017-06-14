set background=dark
colorscheme lucius

if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions+=LlRrb " bug?
    set guioptions-=LlRrb
    set guifont=monospace\ 9 " Way better than monospace
endif

set shortmess+=I                       " Disable splash text
set t_Co=256                           " Fix colors in the terminal
set laststatus=2                       " Always show status bar
set noshowmode                         " Hide default mode string
set mousemodel=popup                   " Enable context menu

filetype on
filetype plugin on
filetype plugin indent on

set backspace=indent,eol,start

"set ttyfast

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartcase

set autoindent

syntax on

set foldenable
set foldmethod=indent
set foldlevelstart=10

set cursorline

"set spell

highlight ColorColumn ctermbg=238 guibg=#444444
set colorcolumn=80

"set listchars=tab:▸\
set list

set number
set showcmd
set ruler
set laststatus=2
set showtabline=2

set hls is
set wrapscan
"set ic          "ignore case in search

" Keeps an automatic backup
"set backup          " Enable Backups
"set backupext=.bak  " Add .bak extension to modified files
"set patchmode=.orig " Copy original file to with .orig extension Before saving.

"{{{ Cursor Color Customizations →
"These are based on blaenkdenum's cool
"mode aware cursor hack. For more, visit
"http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/
"Set the cursor color according to the mode.
"This one should work for most Dark Themes
hi ModeMsg guifg=#FD971F guibg=NONE gui=NONE
"set gcr=a:block
" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor
hi InsertCursor ctermfg=15 guifg=#fdf6e3 ctermbg=37 guibg=#FD971F
hi VisualCursor ctermfg=15 guifg=#000000 ctermbg=125 guibg=#AE81FF
hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65 guibg=#66D9EF
hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#A6E22E
"--------------------------------------------------------------
"}}}
