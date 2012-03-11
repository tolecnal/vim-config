colorscheme railscasts_transparent

set undolevels=100

syntax on

set smarttab
set number
set nocompatible

set hidden

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

" resizing splits
if bufwinnr(1)
  map <leader>. <C-W>+
  map <leader>, <C-W>-
  map <leader>[ <C-W>< 
  map <leader>] <C-W>> 
endif

" setting ident and tap expanding depending on file type
filetype indent on
filetype plugin on

if has("autocmd")
  " indent per type
  au FileType c set cindent tw=79
  au FileType matlab set ai et sw=2 sts=2 noexpandtab tw=78
  au FileType java set ai et sw=4 sts=4 expandtab cindent tw=78
  au FileType python set ai et sw=4 sts=4 expandtab tw=78
  au FileType ruby set ai et sw=2 sts=2 expandtab tw=78
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
  au FileType vim set ai et sw=2 sts=2 expandtab
  au FileType babe set ai et sw=2 sts=2 noexpandtab
  au FileType xml set ai et sw=2 sts=2 noexpandtab
  au FileType sgml set ai et sw=2 sts=2 noexpandtab
  au FileType html,php set matchpairs+=<:> indentexpr= autoindent
  au FileType css set expandtab indentexpr=
  au FileType make setlocal noet ts=4 sw=4 sts=4
  au FileType eruby set ai et sw=4 sts=4 expandtab
  au FileType javascript set ai et sw=4 sts=4 expandtab
  
  augroup gzip
    " Remove all gzip autocommands
    au!

    " Enable editing of gzipped files
    "  read:  set binary mode before reading the file
    "    uncompress text in buffer after reading
    "  write:  compress file after writing
    "  ppend:  uncompress file, append, compress file
    au BufReadPre,FileReadPre *.gz set bin
    au BufReadPost,FileReadPost *.gz let ch_save = &ch|set ch=2
    au BufReadPost,FileReadPost *.gz '[,']!gunzip
    au BufReadPost,FileReadPost *.gz set nobin
    au BufReadPost,FileReadPost *.gz let &ch = ch_save|unlet ch_save
    au BufReadPost,FileReadPost *.gz execute ":doautocmd BufReadPost " . expand("%:r")
    au BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
    au BufWritePost,FileWritePost *.gz !gzip <afile>:r
    au FileAppendPre            *.gz !gunzip <afile>
    au FileAppendPre            *.gz !mv <afile>:r <afile>
    au FileAppendPost           *.gz !mv <afile> <afile>:r
    au FileAppendPost           *.gz !gzip <afile>:r
  augroup END
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" minimalizing GUI
if has('gui_running')
  set guioptions-=T  " remove toolbar
  set guioptions-=m  " remove menubar
  set guioptions-=r  " remove right-hand scroll bar
endif

" show invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
