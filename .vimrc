" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
execute pathogen#infect()
syntax on
filetype plugin indent on
set smartindent
set autoindent
set nocompatible
set number
set nobackup	" do not keep a backup file, use versions instead
set history=50	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set cursorline  " underline the cursor line
set showcmd		" display incomplete commands
set incsearch	" do incremental searching
set hlsearch	" highlight searches
"colorscheme solarized
set background=dark

set wrap		" wrapping on
set linebreak   " wrap whole words
set showbreak=>\ 

set backspace=indent,eol,start

set shiftround
set softtabstop=4
set tabstop=4
set shiftwidth=4
"set expandtab

" show select menu for :cmd and tab
set wildmenu

" change <leader> from \ to ,
let mapleader=','

" When \w is typed, all whitespaces at "empty line" are removed
map <leader>w :%s/\s\+$//<ENTER>

" use tags from current dir and roll up to home if not found
set tags=./tags;~/

set fileformats=unix,dos,mac

" always show status line and set its content
set laststatus=2
set statusline=%F\ %m%r%y\ char:0x%B\ line:%l/%L/%p%%

set novisualbell
set scrolloff=5 " see 5 lines above and below when scrolling

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	au!

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif

	" Fix indentation of a file upon open or write
	autocmd BufRead,BufWritePre *.c,*.cc,*.cpp,*.h,*.hpp normal gg=G
	" c-style commenting command made buffer-specific
	autocmd FileType cpp,c nnoremap <buffer> <leader>c I//<esc>
augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command Diff vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" move by visual lines instead of new lines so it does not skip wrapped lines
nnoremap j gj
nnoremap k gk

" Disable arrows in command mode to use h,j,k,l instead
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

set backup
if &backupdir =~# '^\.,'
	let &backupdir = '/Users/bednarj/Library/Application Support/Vim/backup,' . &backupdir
endif
set swapfile
if &directory =~# '^\.,'
	let &directory = '/Users/bednarj/Library/Application Support/Vim/swap,' . &directory
endif
set undofile
if &undodir =~# '^\.,'
	let &undodir = '/Users/bednarj/Library/Application Support/Vim/undo,' . &undodir
endif
