set shell=/bin/bash
let mapleader = "\<Space>"

set number relativenumber

set nocompatible
filetype off

" =======
" PLUGINS
" =======
call plug#begin('~/.config/nvim/plugged')

" === Intellisense === "
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" === JavaScript === "
" Better .js syntax highlighting
Plug 'othree/yajs.vim'

" === Rust === "
" Rust syntax support
Plug 'rust-lang/rust.vim'

" === Haskell === "
" Haskell syntax support
Plug 'neovimhaskell/haskell-vim'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" ===============

" Use ripgrep for search 
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" ============
" Editor
" ============


" Better message display
set cmdheight=2

" Faster plugin reaction after you stop typing
set updatetime=300

" Turn on filetype detection, indentation and loads plugins for current filetype
filetype plugin indent on

" Indent next line automatically
set autoindent

" Reduce timeout before opening new line
set timeoutlen=300

" Encoding
set encoding=utf-8

" Scroll offset before end of view
set scrolloff=2

" Mode label in bottom left corner
set noshowmode

" Keep buffers hidden, don't prompt save/close
set hidden

" Line wrapping 
set nowrap

" Keeping no extra spaces in between when joining lines
set nojoinspaces

" Always add sign column to prevent fluctuation
set signcolumn=yes

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Clipboard Integration
set clipboard=unnamedplus

" Sane wildmenu - (popup window while typing vim commands)
set wildmenu
set wildmode=list:longest


" Tabs and Indentation
set tabstop=4 " Width of a tab
set shiftwidth=4 " Display width of a tab
set softtabstop=4
set noexpandtab " Don't insert spaces in place of tabs


" Search options
set incsearch " Move highlights while typing
set ignorecase " Default search is case insensitive
set smartcase " Any uppercase char will make search case sensitive
"set gdefault


" Search center screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" Use reg-ex magic mode (extended regex)
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/


" Disable Code folding
set nofoldenable

" Restrict syntax highlighting columns for perf.
set synmaxcol=500

" Better diffing (https://vimways.org/2018/the-power-of-diff/)
set diffopt+=iwhite "No whitespace in vimdiff
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic


" Show a vertical bar at print width
set colorcolumn=80

" Mouse support
set mouse=a " all modes

" Don't show ins-completion-menu messages
set shortmess+=c


" ============
" CoC settings
" ============

set nobackup
set nowritebackup

" Tab completion
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ============
" fzf
" ============

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)


" ============
" Key bindings
" ============

" Open
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick save
nmap <leader>w :w<CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Ctrl+c and Ctrl+j as Esc
" Ctrl-j is a little awkward unfortunately:
" https://github.com/neovim/neovim/issues/5916
" So we also map Ctrl+k
inoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <Esc>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
xnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
lnoremap <C-c> <Esc>
tnoremap <C-c> <Esc>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Suspend with Ctrl+f
inoremap <C-f> :sus<cr>
vnoremap <C-f> :sus<cr>
nnoremap <C-f> :sus<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

