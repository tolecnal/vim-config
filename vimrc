" pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

colorscheme xoria256

set fileencoding=utf-8

set undolevels=100

syntax on

set nocompatible

set smarttab
set smartindent
set magic
set number

set hidden
set backspace=indent,eol,start

set path=.,/usr/include,/usr/local/include

set ruler

set cursorline
set visualbell
set autoindent
set hlsearch

set nowrap linebreak nolist

set nojoinspaces
set showmatch matchtime=3
set matchpairs+=<:>
set showfulltag virtualedit=block
set splitbelow splitright
set incsearch noignorecase
set shortmess+=I showcmd

" backups & history
set nobackup
set nowritebackup
set noswapfile
set history=1000

" when changing (c command) put $
" on word bondary and keep it visible
set cpoptions+=$

" wild menu helping when tabing through matches
set wildmenu

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" resizing splits
if bufwinnr(1)
  map <leader>. <C-W>+
  map <leader>, <C-W>-
  map <leader>[ <C-W>< 
  map <leader>] <C-W>> 
endif

" spell checking
nmap <silent> <leader>s :set spell!<CR>

" highlighting search matches
nmap <silent> <leader>h :set hlsearch!<CR>

" show invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
"  Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Gundo - visualizing redo/undo changes
nmap <leader>g :GundoToggle<CR>

" binding for editing vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" change to directory of opened file
nmap <silent> <leader>cd :lcd %:h<CR>

" allow moving with ctrl+hjkl in insert mode
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

" writing to protected file using :Sw
function! SudoWrite()
  w !sudo dd of=%
  e!
endfunction
command! -nargs=0 Sw call SudoWrite()

" setting indent and tap expanding depending on file type
filetype indent on
filetype plugin on

" no automatic text wrapping for most formats
set fo-=t

"Filemanager options
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split

if has("autocmd")
  " indent per type
  au FileType c set cindent tw=79
  au FileType matlab set ai et sw=2 sts=2 noexpandtab tw=78
  au FileType java set ai et sw=4 sts=4 expandtab cindent tw=78
  au FileType python set ai et sw=4 sts=4 expandtab tw=78
  au FileType ruby set ai et sw=2 sts=2 expandtab tw=78
  au FileType perl set ai et sw=4 sts=4 expandtab tw=78 cindent
  au FileType haskell set ai et sw=4 sts=4 expandtab
  au FileType awk set ai et sw=4 sts=4 noexpandtab tw=78
  au FileType tex set ai et sw=2 sts=2 noexpandtab tw=78 fo+=t
  au FileType cpp set cindent tw=79
  au FileType php set ai et sw=4 sts=4 ts=4 cindent tw=78
  au FileType html set ai et sw=2 sts=2 expandtab tw=78
  au FileType sh set ai et sw=4 sts=4 noexpandtab
  au FileType scheme set ai et sw=1 sts=1 noexpandtab tw=78 lisp
  au FileType lex set ai et sw=2 sts=2 expandtab
  au FileType yacc set ai et sw=2 sts=2 noexpandtab
  au FileType vim set ai et sw=2 sts=2 expandtab
  au FileType babe set ai et sw=2 sts=2 noexpandtab
  au FileType xml set ai et sw=2 sts=2 noexpandtab fo+=t
  au FileType sgml set ai et sw=2 sts=2 noexpandtab fo+=t
  au FileType html,php set matchpairs+=<:> indentexpr= autoindent fo+=t
  au FileType css,scss set ai sw=4 sts=4 expandtab indentexpr=
  au FileType make setlocal noet ts=4 sw=4 sts=4
  au FileType eruby set ai et sw=4 sts=4 expandtab fo+=t
  au FileType javascript set ai et sw=4 sts=4 expandtab
  au FileType vhdl set ai ts=4 sw=4 sts=4 noexpandtab
  
  augroup gzip
    " Remove all gzip autocommands
    au!

    " Enable editing of gzipped files
    "  read:  set binary mode before reading the file
    "    uncompress text in buffer after reading
    "  write:  compress file after writing
    "  append:  uncompress file, append, compress file
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
  
  " autoreload vimrc
  au bufwritepost .vimrc source $MYVIMRC
  au bufwritepost _vimrc source $MYVIMRC

  " detect additional file types
  au BufRead,BufNewFile {Gemfile,Gemfile.local,Rakefile,Thorfile,config.ru} set ft=ruby
endif

" minimizing GUI
if has('gui_running')
  set guioptions-=T  " remove toolbar
  set guioptions-=m  " remove menubar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove right-hand scroll bar
  set guioptions-=e  " text tabs
  set gfn=Droid\ Sans\ Mono\ Dotted\ 10
endif

" disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" view yanking/pasting (number specified by count, defaults to 1)
" use in normal mode:
" zy <some folding> 5zy zp
noremap <silent> zy :<C-u>exe ":mkview ".v:count1<CR>
noremap <silent> zp :<C-u>exe ":loadview ".v:count1<CR>


