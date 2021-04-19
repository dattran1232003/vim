let g:dracula_italic = 0 " Disable random word highlight
filetype off


call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'preservim/vimux'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()


" Bar fonts
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Remap leader key
let mapleader = '-'

" Show line number
set relativenumber
set number

"" Show available match command
:cnoremap <Tab> <C-L><C-D>

"" sort lines by length
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
vnoremap <silent> <Leader><Space> :call SortLines()<CR><CR>

"" Set tab and indent
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

"" MAPPING AREA
" Quick select all lines in file  
nnoremap vA ggVG

" vim file config
nnoremap <silent> <leader>ov :tabnew ~/.vim/vimrc<CR>
nnoremap <silent> <leader>sv :so ~/.vim/vimrc<CR>:echo 'vim sourced'<cr>

" vim netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 0

" Create new plank line
nnoremap <silent> <space> o<esc>

" Toggle relative Number
nnoremap <silent> <leader>tb :set relativenumber!<CR>

" Enable Highlight Search
set hlsearch incsearch ignorecase smartcase
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Turn off highlight
noremap <silent> <Leader><CR> :noh<CR>

" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>3 3gt
nnoremap <Leader>2 2gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

noremap <Leader>te :tabe%:h<CR>						" Easily create a new tab.
noremap <Leader>tc :tabclose<CR>					" Easily close a tab.
noremap <Leader>tm :tabmove<CR>						" Easily move a tab.
noremap <Leader>n :tabnext<CR>						" Easily go to next tab.
noremap <Leader>p :tabprevious<CR>       " Easily go to previous tab.
noremap <Leader>td :DuplicateTabpane<CR> 	" Easily duplicate a tab

" Remap save key to Shift + S
nnoremap <S-s> :w<CR>

" Map exit key in insert mode
inoremap jk <ESC> 
inoremap JK <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>

" Mapping to move line
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Mapping vim tmux navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Mapping for Command Prompt in vim
map <leader>vp :VimuxPromptCommand<cr>

" Quickly Run FZF
nnoremap <C-p> :Files<cr>

" Theme config
syntax on
colorscheme dracula

" Auto Pairs config
let g:AutoPairsFlyMode = 0

" Setting up for javascript syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
" ALE config
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \ 'javascript' : ['eslint', 'prettier']
            \ }

" FZF configure
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-i': 'split',
            \ 'ctrl-s': 'vsplit'
            \ }

" Set clipboard
set clipboard=unnamed

" Coc config
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver' , 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
nmap <silent> <Leader>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>k <Plug>(coc-diagnostic-prev-error)

"" Emmet config
" custom snippets
let g:user_emmet_settings = webapi#json#decode(join(
    \readfile(expand('~/.vim/.snippets_custom.json')), "\n")
    \)

" Typescript config
autocmd BufEnter *.{jx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{jx,ts,tsx} :syntax sync clear
autocmd FileType typescript :set makeprg=tsc

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

