set nocompatible
set background=dark

let Tlist_Inc_Winwidth=0
" pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

if &term == "xterm-256color"
  set t_Co=256
  colorscheme jellybeans
elseif &term == "putty-256color"
  set t_Co=256
  colorscheme jellybeans
else
  colorscheme base16-solarized
endif

let g:airline#extensions#tabline#enabled = 1
set laststatus=2

set fileencoding=utf-8
" Deal with problem with UTF-8 encoding in Windows
if has("win32")
  set fileencodings=utf-8
  set encoding=utf-8
  let $PATH = $HOME . '\vimfiles\bin:' . $PATH
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
  "silent v/<Body>/d
  "silent .!xmllint --format --recover - 2>/dev/null
endfunction
nmap <Leader>P :call PosXML()<CR>

function! ProtelLog() range
  silent %s/.*|//
  silent %s/\s\?[<-]\(.\)[->]\s\?/\1/g
  silent %join!
endfunction

function! PostLog()
  silent v/PostPayment\|PostCharge/d
  silent g/PostPaymentResult\|PostChargeResult/d
  silent %s/.*: Socket request.*with Parameters '//g
  silent %s/' by automate.*//g
  silent %s/^\(.*\)$/<Post>\1<\/Post>/g
  let optag = "<Body>"
  let cltag = "</Body>"
  call append(line('^'), optag)
  call append(line('$'), cltag)
  silent %s/\(<\/.\{-}>\)/\1\r/g
  silent %s/<Post>/<Post>\r/g
  setfiletype xml
  silent .!xmllint --format --recover - 2>/dev/null
  call feedkeys("\<ESC>gg=G\<CR>")
  silent %s/\_.<\/Body>\_./<\/Body>/g
endfunction

function XmlTidy() range
  silent !clear
  silent %s#\\"#"#g
  silent .!xmllint --format --recover - 2>/dev/null
  silent !clear
endfunction
command! -nargs=? XmlTidy call XmlTidy()

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

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
let g:tskelDateFormat = "%c"

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

"
" DiffWithSaved()
" Function to git a diff of current buffer and the original file
" URL: http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
"

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Maps <F5> to remove unwanted whitespaces in current buffer
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"
" Maps =j to pretty format JSON and function
" to do the same
"
nmap =j :%!python -m json.tool<CR>
function! FormatJSON()
  :%!python -m json.tool
endfunction

"
" Enable the syntastic plugin, set mode to active
" passive_filetypes are file types to *not* be checked by syntastic
"
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [] }
"  \ 'passive_filetypes': [''] }
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list=1

"
" Settings for neocomplcache
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

function! SolrCleanup()
  set nopaste
  setfiletype text
  silent :%s#\s\?{\s\?\n##g
  silent :%s#\s\?},\?\s\?\n##g
  silent :%s#"platform_document_id":\s"\(.*\)",#<Item>\r<docid>\1</docid>>#g
  silent :%s#"score":\s\(.*\)$#<score>\1</score>\r</Item>#g
  silent :%s#"platform_documentmetadata":\s"\(.*\)",#\1#g
  silent :%s#\\n#\r#g
  silent :%s#\\"#"#g
  silent :%s#\s\+$##g
  let optag = "<Body>"
  let cltag = "</Body>"
  call append(line('^'), optag)
  call append(line('$'), cltag)
  silent :%g/^$/d
  "silent .!xmllint --format --recover - 2>/dev/null
  call feedkeys("\<ESC>gg=G\<CR>")
  "call feedkeys("\<ESC>gg=G\<CR>")
  setfiletype xml
endfunction
command! -nargs=? SolrCleanup call SolrCleanup()

function! LicCleanup()
  set nopaste
  setfiletype text
  silent :%s#\(<License[^/>]*>\)#\1\r#
  silent :%s#\(<ActivationDate>.*</ActivationDate>\)#\1\r#
  silent :%s#\(<CustomerId>.*</CustomerId>\)#\1\r#
  silent :%s#\(<CustomerName>.*</CustomerName>\)#\1\r#
  silent :%s#\(<SalesOrderNumber>.*</SalesOrderNumber>\)#\1\r#
  silent :%s#\(<SalesOrderDate>.*</SalesOrderDate>\)#\1\r#
  silent :%s#\(<ProductId>.*</ProductId>\)#\1\r#
  silent :%s#\(<ProductDescription>.*</ProductDescription>\)#\1\r#
  silent :%s#\(</MachineKey>\)#\1\r#
  silent :%s#\(</MachineKey>\)#\1\r#
  silent :%s#\(<Capabilities>\)#\1\r#
  "silent :%s#\(<Capability[^/>]*/>\)#\1\r#
  silent :%s#\(</Capabilities>\)#\1\r#
  silent :%s#\( />\)#\1\r#g
  silent :%s#\(name="[^"]*"\)#\1\r\t#g
  silent :g/^$/d
  setfiletype xml
endfunction
command! -nargs=? LicCleanup call LicCleanup()

let g:tversions = {
      \ 'last change': {
      \   'marker_rx': '@Last Change:\s*\w\{3}\s\d\{2}\s\w\{3}\s\d\{4}\s\d\d:\d\d:\d\d\s\w\{3,}',
      \   'group_idx': -1,
      \   'inc': 'strftime("%a %d %b %X %Z")',
      \   },
      \}
