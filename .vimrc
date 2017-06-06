set encoding=utf-8
" =============================================================================
" vim-plug
" _____________________________________________________________________________
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'								" Sensible setup
Plug 'kien/ctrlp.vim'									" Fuzzy search
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }	" On-demand loading
Plug 'vim-syntastic/syntastic'							" Linter and syntax
Plug 'tpope/vim-fugitive'								" Git pluggin
Plug 'tpope/vim-surround'								" Surround with ( { etc
" Autocomplete on vim
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-complreter' }
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
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
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

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

syntax on				" switch syntax highlighting on

set number				" show line numbers
" set relativenumber		" show relative line numbers
set showcmd				" display typed commands
set wildmenu			" command line suggestions

" Line wrapping
set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

" line breaking
set textwidth=0 wrapmargin=0

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:▸\ ,eol:¬
"trail:extends:,precedes:
" set showbreak=J

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" =============================================================================
" Plugin Configs
" _____________________________________________________________________________

" ---   Nerdtree ---
" close after a file is opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1 " show hidden files in NERDTree

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" --- Syntastic ---
set statusline+=%#warnignmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_pop_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq =0

" --- Fuzzy Search ---
nmap <silent> <leader>r :CtrlBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" ctrlp ignores patterns
let g:ctrlp_custom_ignore = {
	\ 'dir': '\.git',
	\ 'file': '\.so'
	\ }

" You Complete me
let g:ycm_server_python_interpreter = 'python2.7'

" =============================================================================
" Functions
" _____________________________________________________________________________


" --- CTAGS ---
command! MakeTags !ctags -R .

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
