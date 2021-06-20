set encoding=UTF-8

let g:dracula_italic = 0 " Disable random word highlight

if !has('gui_running')
  set t_Co=256
endif

call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Lightline
Plug 'itchyny/lightline.vim'

" Typescript & Javscript
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" -- Haskell
Plug 'alx741/vim-hindent'
Plug 'neovimhaskell/haskell-vim'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Plugin & Syntax supports
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" color the color
Plug 'chrisbra/Colorizer'

" icons
Plug 'ryanoasis/vim-devicons'

" Others
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

"" Show available match command
:cnoremap <Tab> <C-L><C-D>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file


" Set persist folding code on save
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Cursor shape
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM plugins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree config
augroup nerdtree_CMDs 
  autocmd!

  "" Exit Vim if NERDTree is the only window left.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit | endif

  "" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END

" fix navigator jumping
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

"" Toogle map
nmap <F4> :NERDTreeToggle<CR>

" Bar fonts
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" prevent break long lines
set linebreak 

" stop insert new blank line (I guess)
set textwidth=0 wrapmargin=0 

" Remap leader key
let mapleader = '-'

" Show line number
set relativenumber
set number


"" sort lines by length
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
vnoremap <silent> <Leader><Space> :call SortLines()<CR><CR>

"" Set tab and indent
filetype plugin indent on

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

"colorscheme material 
" let g:material_terminal_italic = 1
" let g:material_theme_style = 'lighter'


" register config
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap p "_dP

" Auto Pairs config
let g:AutoPairsFlyMode = 0

" Setting up for javascript syntax
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" ALE config
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" let g:ale_linters = {
"             \   'javascript': ['eslint'],
"             \}
" let g:ale_fixers = {
"             \ 'javascript' : ['eslint', 'prettier']
"             \ }

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
let g:coc_global_extensions = ['coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank']
nmap <silent> <Leader>j <Plug>(coc-diagnostic-next-error)
nmap <silent> <Leader>k <Plug>(coc-diagnostic-prev-error)

nnoremap <silent> K :call CocAction('doHover')<CR>

let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_expandabbr_key = '<C-x><C-e>'

imap <silent><expr> <Tab> <SID>expand()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)

function! s:expand()
  if pumvisible()
    return "\<C-y>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1]  =~# '\s'
    return "\<Tab>"
  endif
  return "\<C-x>\<C-e>"
endfunction

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="^z"
let g:UltiSnipsJumpBackwardTrigger="^b"

" Typescript config
augroup ts_CMDs
  autocmd!

  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
augroup END

" augroup SyntaxSettings
"     autocmd!
"     autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
" augroup END

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" markdown preview config
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" -- Haskell config
" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
" let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Disable indent, using hindent
let g:haskell_indent_disable = 1

" Hindent config
let g:hindent_on_save = 1

" lightline config
set laststatus=2
set noshowmode


let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'], ['percent'], 
      \              ['fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }


