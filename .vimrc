call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-abolish'
Plug 'pearofducks/ansible-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'hashivim/vim-terraform'
Plug 'lervag/vimtex'
call plug#end()

" Enable syntax highlighting
syntax on

" utf-8
set encoding=utf-8
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set incsearch
set hlsearch

"------------------------------------------------------------
" LaTeX
filetype plugin indent on
let g:vimtex_view_method = 'zathura'

"------------------------------------------------------------
" LaTeX
set updatetime=300
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


"------------------------------------------------------------
" Usability options
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
"set ignorecase
"set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent
set backspace=indent,eol,start

" Keep n lines off edges when scrolling
" set scrolloff=4

" Always display the status line, even if only one window is displayed
set laststatus=2

" Display line numbers on the left
set number

" Hide cursor line highlighting
set nocursorline

"------------------------------------------------------------
" Indentation options
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

"------------------------------------------------------------
" FileType and per FileType indentation settings
autocmd BufNewFile,BufRead *.md set ft=markdown
au FileType python,json set shiftwidth=4 softtabstop=4 tabstop=4 expandtab

" Ansible-vim
au BufRead,BufNewFile */*ansible/*.yml set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 0
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'

let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }

"------------------------------------------------------------
" Color settings
" let g:dracula_colorterm = 0
colorscheme onedark
set background=dark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"------------------------------------------------------------
" surround
let g:surround_100 = "{{ \r }}"

"------------------------------------------------------------
" NERDTree
" Automatically open NERDTree
"autocmd VimEnter * NERDTree | wincmd p

" Misc NERDTree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1

"------------------------------------------------------------
" lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' },
  \ }

"------------------------------------------------------------
" Bindings/keymaps

" F2 toggle relative number
map <F2> :set relativenumber!<CR>

" F3 toggle number
map <F3> :set number!<CR>

" F4 toggle binds cheatsheet
map <F4> :call ToggleCheatsheet()<CR>

" F5 toggle paste/no paste
map <F5> :set paste!<CR>

" F6 toggle list (show spaces, tabs...)
map <F6> :set list!<CR>

" F7 NERDTree
map <F7> :NERDTreeToggle<CR>

" cheatsheet toggle func
let s:cs_enabled = 0

function! ToggleCheatsheet()
  if s:cs_enabled
    :helpclose
    let s:cs_enabled = 0
  else
    :help generic-binds
    let s:cs_enabled = 1
  endif
endfunction

" fzf
let mapleader = " "
nnoremap <silent> <leader><leader> :GFiles<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>O :BTags<CR>
nnoremap <silent> <leader>o :Tags<CR>
nnoremap <silent> <leader>, :History<CR>

" completion options
set completeopt=menu,preview
