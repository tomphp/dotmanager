let mapleader = "\<space>"
let maplocalleader = "`"

" Switch modes
"imap jk <Esc>

"Navigate wrapped lines
nnoremap j gj
nnoremap k gk

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Save as root
cnoremap w!! %!sudo tee > /dev/null %

" Better command line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-h> <t_kl>
cnoremap <C-l> <t_kr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" OS Copy & Paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Search for currently selected text
vnoremap // y/<C-R>"<CR>

" Leader F for easymotion find anywhere
map <Leader>f <Plug>(easymotion-s)

" Change cycle
nmap <silent> ccn <Plug>CycleNext
vmap <silent> ccn <Plug>CycleNext
nmap <silent> ccp <Plug>CyclePrev
vmap <silent> ccp <Plug>CyclePrev

" Ctrl+P for Unite
nnoremap <silent> <Leader>o :CommandT<CR>

" CTRL+S for save

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified
    \|  if empty(bufname('%'))
    \|      browse confirm write
    \|  else
    \|      confirm write
    \|  endif
    \|endif

nnoremap <silent> <leader>s :<C-u>Update<CR>

" CTRL+SPACE for autocomplete
"imap <c-Space> <c-x><c-o>
"imap <C-@> <C-Space>

" NERDTree Mappings
noremap <Leader>b :NERDTreeToggle<CR>

" Select all
noremap <Leader>a ggVG

" Search Project
noremap <leader>g :Ag <C-r><C-w><CR>

" Execute
nnoremap <Leader>ee :T<Space>
nnoremap <Leader>ea :T<Up><CR>
nnoremap <Leader>ef :T  %<Left><Left>

" Move lines up and down (requires alt aka gvim)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
