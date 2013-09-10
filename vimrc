set t_Co=256
let Tlist_Inc_Winwidth=0
" pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

colorscheme transxoria

set fileencoding=utf-8
" Deal with problem with UTF-8 encoding in Windows
if has("win32")
  set fileencodings=utf-8
  set encodings=utf-8
endif

set undolevels=100

syntax on

set smarttab
set smartindent
set autoindent
set backspace=indent,eol,start

set magic
set number
if version >= 703
  set relativenumber
endif
set cursorline
set ruler

" switch between buffers without saving
set hidden

set path=.,/usr/include,/usr/local/include

set visualbell
set hlsearch

set nowrap linebreak nolist

set nojoinspaces " only one space when joinning
set showmatch matchtime=3 " matching bracket
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
" on word boundary and keep it visible
set cpoptions+=$

" wild menu helping when tabing through matches
set wildmenu

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" setting indent and tab expanding depending on file type
filetype indent on
filetype plugin on

" no automatic text wrapping for most formats
set fo-=t

" global textwidth
set textwidth=78

" nice invisibles
set listchars=tab:▸\ ,eol:¬

" Auto window resizing
" Nasty Hack: height must be bigger than minheight on setting.
" Fails when huge at fist.
set winwidth=84
set winheight=10
set winminheight=10
set winheight=999

" turn off highlighting by hitting enter
nmap <silent> <CR> :nohlsearch \| :call MarkMultipleClean()<CR>
vmap <silent> <CR> :nohlsearch \| :call MarkMultipleClean()<CR>

" navigate through buffers easily
nmap <silent> gb :CtrlPBuffer<CR>

" spell checking
nmap <silent> <leader>s :set spell!<CR>

" toggle spelling language
function! SpellingLanguageToggle()
  if (&spelllang == 'pl')
    set spelllang=en
  else
    set spelllang=no
  endif
endfunc
nmap <silent> <leader>S :call SpellingLanguageToggle()<CR>

" Gundo - visualizing redo/undo changes
nmap <leader>g :GundoToggle<CR>

" show invisibles
nmap <leader>l :set list!<CR>

" toggle color column
function! ColorColumnToggle()
  if (&colorcolumn == '+1')
    set colorcolumn=
  else
    set colorcolumn=+1
  endif
endfunc
nmap <silent> <leader>cc :call ColorColumnToggle()<CR>

" change to directory of opened file
nmap <leader>cd :lcd %:h<CR>

" toggle relative/normal line numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
 endif
endfunc
nmap <silent> <leader>n :call NumberToggle()<CR>

" Unimpaired text bubbling
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" binding for editing vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" change behaviour of c-n c-p to more common-sense in command line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" view yanking/pasting (number specified by count, defaults to 1)
" use in normal mode:
" zy <some folding> 5zy zp
noremap <silent> zy :<C-u>exe ":mkview ".v:count1<CR>
noremap <silent> zp :<C-u>exe ":loadview ".v:count1<CR>

" %% will expand to current dir in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" eclim java
nmap <leader>ji :JavaImport<CR>
nmap <leader>jI :JavaImportMissing<CR>
nmap <leader>jr :Java<CR>
nmap <leader>jd :JavaDocSearch<CR>
nmap <leader>eo :ProjectOpen<CR>

" writing to protected file using :Sw
function! SudoWrite()
  w !sudo dd of=%
  e!
endfunction
command! -nargs=0 Sw call SudoWrite()

" minimizing GUI
if has('gui_running')
  set guioptions-=T  " remove toolbar
  set guioptions-=m  " remove menubar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove right-hand scroll bar
  set guioptions-=e  " text tabs
  set gfn=Droid\ Sans\ Mono\ Dotted\ 8
endif

if has("autocmd")
  " enter will work in command edit mode as intended
	au CmdwinEnter * noremap <buffer><CR> <CR>

  " jump to last know position in the file
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  au FileType c            setl cindent tw=79
  au FileType cpp          setl cindent tw=79
  au FileType java         setl ai ts=4 sw=4 sts=4   expandtab cindent
  au FileType perl         setl ai ts=4 sw=4 sts=4   expandtab cindent
  au FileType python       setl ai ts=4 sw=4 sts=4   expandtab
  au FileType ruby         setl ai ts=2 sw=2 sts=2   expandtab
  au FileType awk          setl ai ts=4 sw=4 sts=4 noexpandtab
  au FileType html         setl ai ts=4 sw=4 sts=4   expandtab
  au FileType sh,zsh       setl ai ts=4 sw=4 sts=4   expandtab
  au FileType vim          setl ai ts=2 sw=2 sts=2   expandtab
  au FileType xml          setl ai ts=4 sw=4 sts=4 noexpandtab
  au FileType css,scss     setl ai ts=4 sw=4 sts=4   expandtab
  au FileType make         setl ai ts=4 sw=4 sts=4 noexpandtab
  au FileType eruby        setl ai ts=4 sw=4 sts=4   expandtab
  au FileType javascript   setl ai ts=4 sw=4 sts=4   expandtab
  au FileType coffee       setl ai ts=2 sw=2 sts=2   expandtab
  au FileType tex,plaintex setl ai ts=2 sw=2 sts=2 noexpandtab fo+=t
  au FileType php          setl ai ts=2 sw=2 sts=2   expandtab cindent

  au FileType markdown     setl tw=77 fo+=t
  au FileType gitcommit    setl tw=72 fo+=t
  
  " autoreload vimrc
  au BufWritePost .vimrc source $MYVIMRC
  au BufWritePost _vimrc source $MYVIMRC

  augroup filetypedetect
    au BufRead,BufNewFile *mutt-* setl filetype=mail tw=72 fo+=t
  augroup END

  augroup gzip
    " Remove all gzip autocommands
    au!

    " Enable editing of gzipped files
    au BufReadPre,FileReadPre     *.gz setl bin
    au BufReadPost,FileReadPost   *.gz let ch_save = &ch|setl ch=2
    au BufReadPost,FileReadPost   *.gz '[,']!gunzip
    au BufReadPost,FileReadPost   *.gz setl nobin
    au BufReadPost,FileReadPost   *.gz let &ch = ch_save|unlet ch_save
    au BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
    au BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
    au BufWritePost,FileWritePost *.gz !gzip <afile>:r
    au FileAppendPre              *.gz !gunzip <afile>
    au FileAppendPre              *.gz !mv <afile>:r <afile>
    au FileAppendPost             *.gz !mv <afile> <afile>:r
    au FileAppendPost             *.gz !gzip <afile>:r
  augroup END
endif

"
" Function to clean up PosXML log and prettify the XML output
"
function! PosXML() range
  silent %s/.*|//
  silent %s/\s\?[<-]\(.\)[->]\s\?/\1/g
  silent %join!
  silent %s/CR\s\{-}LF/\r/g
  silent v/<Body>/d
  silent .!xmllint --format --recover - 2>/dev/null
endfunction
nmap <Leader>P :call PosXML()<CR>

"
"This function is used to update the serial in the SOA from a bind file
"
function! UpdateDNSSerialZone()
  " Initialisation des variables
  let serialZone=0
  let serialZoneUpdated=0
  "Search for a line that start with a year and contains the word Serial
  let numberOfLine = search('\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)\d\d.*[Ss]erial.*')
  if numberOfLine == 0
    echo "No bind serial found ! so not updating the file"
  else

    "Get the line contents 
    let line = getline(numberOfLine)
    "Extract the serial number  
    let serialZone=strpart(line, match(line,'\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)'),match(line,";")-1-match(line,'\(19\|20\)\d\d\(0[1-9]\|1[012]\)\(0[1-9]\|[12][0-9]\|3[01]\)'))

    " Create a new server number for today
    let serialZoneUpdated=strftime("%Y%m%d")."01"

    " If the found serial date matches the one from today then we have to
    " increment
    if serialZone =~ "^.*".strftime("%Y%m%d").".*"
      let serialZoneUpdated=serialZone+1
    endif
    " Build a new line with the updated serial
    let line = "\t".serialZoneUpdated."\t; Serial (YYYYMMDD##)"
    " Write the line back to the file
    call setline(numberOfLine, line)
    echo "Old serial = \"".serialZone."\" updated serial to = \"".serialZoneUpdated."\""
    call feedkeys("\<ESC>gg=G\<CR>")
  endif
endfunction
nmap <leader>S :call UpdateDNSSerialZone()<CR>

"
" This function toggles line number between relative/none relative/no
" numbering. Useful for copy and paste via putty etc.
"
let g:relativenumber = 0
function! ToogleRelativeNumber()
  if g:relativenumber == 0
    let g:relativenumber = 1
    set norelativenumber
    set number
  elseif g:relativenumber == 1
    let g:relativenumber = 2
    set nonumber
    set relativenumber
  else
    let g:relativenumber = 0
    set nonumber
    set norelativenumber
  endif
endfunction
map <F12> :call ToogleRelativeNumber()<CR>

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
set laststatus=2

"
" Config for tskeleton
" Ref: https://github.com/tomtom/tskeleton_vim
"
autocmd BufNewFile *.pl           TSkeletonSetup perl.pl
autocmd BufNewFile *.sh           TSkeletonSetup sh.sh

let g:tskelUserName = "Jostein Elvaker Haande - aka tolecnal"
let g:tskelUserEmail = "tolecnal@tolecnal.net"
let g:tskelUserWWW = "http://tolecnal.net"
let g:tskelLicense = "GPL2"

autocmd BufWritePre * call tskeleton#IncreaseRevisionNumber()

"
" Paste toggle
" Source: http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
"
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
set showmode

" More Apache config files
au BufNewFile,BufRead access.conf*,apache.conf*,apache2.conf*,httpd.conf*,srm.conf* setl filetype=apache
au BufNewFile,BufRead */etc/apache2/*.conf*,*/etc/apache2/conf.*/*,*/etc/apache2/mods-*/*,*/etc/apache2/sites-*/*,*/etc/httpd/conf.d/*.conf* setl filetype=apache

" JSON stuff
" http://www.vim.org/scripts/script.php?script_id=1945
au! BufRead,BufNewFile *.json setl filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  "autocmd FileType json set foldmethod=syntax
augroup END
