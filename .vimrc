" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" It must be the first instruction.
set nocompatible

" ----------------------------------------------------------------------------------------

"Plugins
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'				" Vundle. Plugin manager

Plugin 'tomtom/tcomment_vim'				" Coment and uncomment lines

Plugin 'airblade/vim-gitgutter'				" Git info in left side

Plugin 'Valloric/YouCompleteMe'				" Autocomplete

Plugin 'fatih/vim-go'						" Vim go suport

Plugin 'yggdroot/indentline'				" Indent line display for spaces

Plugin 'luochen1990/rainbow'				" Parentheses rainbow colors

" All of your Plugins must be added before the following line
call vundle#end()            " required

" ----------------------------------------------------------------------------------------

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" ----------------------------------------------------------------------------------------

" Colors and Syntax
colorscheme hybrid					" select color scheme
set background=dark					" dark background for console
syntax enable           			" enable syntax processing

" ----------------------------------------------------------------------------------------

" Spaces and Tabs
set autoindent			" Autoindent
set noexpandtab			" Use hard tabs
set tabstop=4			" number of visual spaces per TAB
set shiftwidth=4		" number of spaces in autoindent

" ----------------------------------------------------------------------------------------

" Folding
set foldmethod=syntax
set nofoldenable
set foldnestmax=3

" ----------------------------------------------------------------------------------------

" UI Configuration
set number              " show line numbers
set relativenumber		" show relative number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line

set ruler				" Display the cursor position on the last line of the screen
set wildmenu            " visual autocomplete for command men
set showmatch           " highlight matching [{()}]
set showmode			" show insert/replace/visual mode

" ----------------------------------------------------------------------------------------

" Encoding
set encoding=utf-8		" encoding used for displaying file
set fileencoding=utf-8	" encoding used when saving file

" ----------------------------------------------------------------------------------------

" Searching
set ignorecase			" Use case insensitive search, except when using capital letters
set smartcase
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" ----------------------------------------------------------------------------------------

" Misc
set mouse=a				" Enable use of the mouse for all modes
set confirm				" raise a dialogue asking if you wish to save changed files
set nobackup			" Donot keep a file~ as a backup

" ----------------------------------------------------------------------------------------

" Plugins configurations

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" indentline
set list lcs=tab:\|\ 

" rainbow
let g:rainbow_active = 1

" ----------------------------------------------------------------------------------------

" General Key Mappings
if has("autocmd")
	autocmd FileType python 	so ~/.vim/shortcuts/python.vim			"  Python shortcuts
	autocmd FileType go 		so ~/.vim/shortcuts/go.vim				"  Go shortcuts
	autocmd FileType lisp 		so ~/.vim/shortcuts/clisp.vim			"  CLISP shortcuts
	autocmd FileType clojure 	so ~/.vim/shortcuts/clojure.vim			"  Clojure shortcuts
	autocmd FileType rust 		so ~/.vim/shortcuts/rust.vim			"  Rust shortcuts
endif

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a