colorscheme railscasts_transparent

set undolevels=100

syntax on

set smarttab
set number
set nocompatible

set backspace=indent,eol,start
set path=.,/usr/include,/usr/local/include
set viminfo='20,\"50,h history=50

set ruler

set visualbell
set autoindent
set hlsearch

set autochdir
set formatoptions=tcroql1 nojoinspaces
set cinoptions=>1s,n0,f0,{1s,}0,^-1s,:1s,g0,+1s,(0
set showmatch matchtime=3
set showfulltag virtualedit=block
set splitbelow splitright
set incsearch noignorecase
set shortmess+=I showcmd

if has('gui_running')
  set guioptions-=T  "remove toolbar
  set guioptions-=m  "remove menubar
  set guioptions-=r  "remove right-hand scroll bar
endif

filetype indent on
filetype plugin on

au FileType c set cindent tw=79
au FileType matlab set ai et sw=2 sts=2 noexpandtab tw=78
au FileType java set ai et sw=4 sts=4 expandtab cindent tw=78
au FileType python,ruby set ai et sw=4 sts=4 expandtab tw=78
au FileType perl set ai et sw=4 sts=4 expandtab tw=78 cindent
au FileType awk set ai et sw=4 sts=4 noexpandtab tw=78
au FileType tex set ai et sw=2 sts=2 noexpandtab tw=78
au FileType cpp set cindent tw=79
au FileType php set ai et sw=4 sts=4 ts=4 cindent tw=78
au FileType html set ai et sw=2 sts=2 expandtab tw=78
au FileType sh set ai et sw=4 sts=4 noexpandtab
au FileType scheme set ai et sw=1 sts=1 noexpandtab tw=78 lisp
au FileType lex set ai et sw=2 sts=2 expandtab
au FileType yacc set ai et sw=2 sts=2 noexpandtab
au FileType vim set ai et sw=2 sts=2 noexpandtab
au FileType babe set ai et sw=2 sts=2 noexpandtab
au FileType xml set ai et sw=2 sts=2 noexpandtab
au FileType sgml set ai et sw=2 sts=2 noexpandtab
au FileType html,php set matchpairs+=<:> indentexpr= autoindent
au FileType css set expandtab indentexpr=
au FileType make setlocal noet ts=4 sw=4 sts=4

" Don't use Ex mode, use Q for formatting
map Q gq

if has("autocmd")
  augroup gzip
    " Remove all gzip autocommands
    au!
  
    " Enable editing of gzipped files
    "	  read:	set binary mode before reading the file
    "		uncompress text in buffer after reading
    "	 write:	compress file after writing
    "	append:	uncompress file, append, compress file
    autocmd BufReadPre,FileReadPre	*.gz set bin
    autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
    autocmd BufReadPost,FileReadPost	*.gz set nobin
    autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")
  
    autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
    autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r
  
    autocmd FileAppendPre			*.gz !gunzip <afile>
    autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
    autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
    autocmd FileAppendPost		*.gz !gzip <afile>:r
  augroup END
endif

