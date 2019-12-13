set encoding=utf-8
" =============================================================================
" vim-plug
" _____________________________________________________________________________
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'								" Sensible setup
Plug 'kien/ctrlp.vim'									  " Fuzzy search
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }	" On-demand loading
" Plug 'vim-syntastic/syntastic'							" Linter and syntax
Plug 'tpope/vim-fugitive'								" Git pluggin
Plug 'tpope/vim-surround'								" Surround with ( { etc
Plug 'SirVer/ultisnips'									" Snippets of code Engine
Plug 'honza/vim-snippets'								" Snippets of code Engine
" Autocomplete on vim
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" Plug 'LucHermitte/vim-refactor'
"
" User inerface
" Plug 'altercation/vim-colors-solarized' " Solarized theme
Plug 'vim-airline/vim-airline'					" Fancy botton bar
Plug 'vim-airline/vim-airline-themes'   " Themes for the botton bar
call plug#end()

" =============================================================================
" General Configs
" _____________________________________________________________________________
filetype plugin indent on
set nocompatible " not compatible with vi
set autoread " detect when a file is changed
set backspace=indent,eol,start " make backspace behave in a sane manner
set path+=** " recursive :find files inside the project tree


" --- Tab control ---
set expandtab " tabs are spaces
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" set a map leader for more key combos
let mapleader = ','

" =============================================================================
" User Interface
" _____________________________________________________________________________

" --- Searching ---
set ignorecase			" case insensitive searching
set smartcase			" case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch			" set incremental search, like modern browsers
set nolazyredraw		" don't redraw while executing macros
set magic				" Set magic on, for regex
set showmatch			" show matching braces
set mat=5				" how many tenths of a second to blink
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" --- Enable caps lock to Escape --- (only works on linux host)
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" --- error bells ---
set noerrorbells
set visualbell
set t_vb=
set tm=500

" --- vertical line ---
set colorcolumn=80,81,82,83
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

syntax on				" switch syntax highlighting on

set number				          " show line numbers
" set relativenumber        " show relative line numbers
set showcmd				          " display typed commands
set wildmenu			          " command line suggestions
set wildmode=longest,list   " complete longest common str, then ls others
	" --- Line wrapping ---
set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

" --- line breaking ---
set textwidth=0 wrapmargin=0

set autoindent              " automatically set indent of new line
"set smartindent

" --- Code folding ---
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" --- toggle invisible characters ---
"set list
"set listchars=tab:▸\ ,eol:¬
"trail:extends:,precedes:
"set showbreak=...

" --- highlight conflicts ---
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


" --- disable autocomment next line ---
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" --- Some Re-maps ---
" tab navigation
nnoremap <F7> gT
nnoremap <F8> gt
nnoremap <leader><F7> :tabm -1<CR>
nnoremap <leader><F8> :tabm +1<CR>

" save document
nnoremap <F2> :w<cr>

" reload .vimrc
nnoremap <F12> :source ~/.vimrc<cr>

" open ~/.vimrc in a new tab for editing
nnoremap <F11> :tabe ~/.vimrc<cr>

" search for text under selection
vnoremap <leader>f "hy/<C-r>h<cr>

" replace text under selection
vnoremap <leader>r "hy:%s/<C-r>h//g<left><left>
" with confirm prompt
vnoremap <leader>R "hy:%s/<C-r>h//gc<left><left><left>


" =============================================================================
" Plugin Configs
" _____________________________________________________________________________

" --- Solarized theme ---
"set background=light
"colorscheme solarized

" --- Airline custom botton bar ---
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#show_splits = 0
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='minimalist'

" ---   Nerdtree ---

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1 " show hidden files in NERDTree

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" --- Syntastic ---
"set statusline+=%#warnignmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_quiet_messages = { "type": "style" }

"let g:syntastic_always_pop_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

" --- Fuzzy Search ---
nmap <silent> <leader>r :CtrlBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" ctrlp ignores patterns
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]((\.(git|hg|svn))|build)$',
      \ 'file': '\v\.(exe|so|dll)$'
      \ }
" You Complete me
let g:ycm_server_python_interpreter = 'python2.7'

" =============================================================================
" Functions
" _____________________________________________________________________________


" --- CTAGS ---
command! MakeTags !ctags -R --exclude=.git .
" CTRL+\	Opens tag in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" ALT+]		Opens tag in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" --- CLANG Functions ---
" Those lines were added for clang-check to work within vim by pressing F5

function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

nmap <silent> <F5> :call ClangCheck()<CR><CR>

function! ClangFormat()
  :%! clang-format %
endfunction

map <C-k> :call ClangFormat()<CR><CR>
