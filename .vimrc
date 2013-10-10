set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'aaronbieber/quicktask'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle '~/.vim/bundle/'
" ...
" for emmet 

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
"
 
""""" start vimrc
let mapleader=","
set hidden

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR:

" quickly save 
noremap <Leader>w :w<CR>
" quickly search
noremap <Space> /

" paste toggle to paste large text 
set pastetoggle=<leader>p


set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep


filetype plugin indent on

if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif


nmap <silent> ,/ :nohlsearch<CR>



nnoremap ; :


let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set encoding=utf-8

"ctrlp settings
noremap <leader>o :CtrlP<cr>
noremap <leader>b :CtrlPBuffer<cr>
noremap <leader>m :CtrlPMixed<cr>

"left/right arrows to switch buffers in normal mode and up arrow to move to
"last buffer
map <right> :bn<cr>
map <left> :bp<cr>
map <up>  :b #<cr>


"emmet setting
function! s:zen_html_tab()
  let line = getline('.')
  if match(line, '<.*>') >= 0
    return "\<c-y>n"
  endif
  return "\<c-y>,"
endfunction
autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()
